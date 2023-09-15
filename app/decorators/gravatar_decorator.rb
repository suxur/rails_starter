class GravatarDecorator < BaseDecorator
  def gravatar_url
    "https://www.gravatar.com/avatar/#{email_hash}?d=identicon"
  end

  private

  def email_hash
    Digest::MD5.hexdigest(email.downcase)
  end
end
