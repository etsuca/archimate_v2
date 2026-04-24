class StaticPagesController < ApplicationController
  before_action :require_authenticated_user, only: :top
  before_action :redirect_authenticated_user_from_welcome, only: :welcome

  def top
  end

  def welcome
  end

  def terms
  end

  def privacy_policy
  end

  private

  def require_authenticated_user
    redirect_to root_path unless user_signed_in?
  end

  def redirect_authenticated_user_from_welcome
    redirect_to authenticated_root_path if user_signed_in?
  end
end
