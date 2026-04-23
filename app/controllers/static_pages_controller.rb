class StaticPagesController < ApplicationController
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

  def redirect_authenticated_user_from_welcome
    redirect_to authenticated_root_path if user_signed_in?
  end
end
