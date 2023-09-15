FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y ca-certificates curl gnupg

# Postgres
RUN sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Node
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Install above deps
RUN apt-get update -qq \
    && apt-get install -y build-essential libvips nodejs postgresql-client \
    && apt-get clean \
    && npm install -g yarn npm@latest \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

RUN gem install bundler --no-document
RUN gem update --system && gem install foreman

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./
RUN bundle check || bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files
RUN mkdir -p tmp/pids

COPY . ./
