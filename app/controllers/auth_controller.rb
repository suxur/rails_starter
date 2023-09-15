class AuthController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  private

  def set_user
    @user = GravatarDecorator.new(current_user)
  end
end
