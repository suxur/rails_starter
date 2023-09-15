class ShowFacade
  attr_reader :user, :params

  def initialize(user, params = {})
    @user = user
    @params = params
  end

  def title
    record.name
  end

  def icon_path
    record.icon
  end

  def logo_path
    record.logo
  end

  def has_logo?
    record.logo.attached?
  end

  def achievements
    record.achievements
  end

  def record
    raise NotImplementedError
  end
end
