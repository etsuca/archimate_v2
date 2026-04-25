class Users::SessionsController < Devise::SessionsController
  def guest_login
    return redirect_to authenticated_root_path, alert: t("devise.failure.already_authenticated") if current_user

    random_value = SecureRandom.hex
    user = User.create!(
      guest: true,
      name: "ゲストユーザー",
      email: "guest_#{random_value}@example.com",
      password: Devise.friendly_token.first(20)
    )

    sign_in user

    redirect_to after_sign_in_path_for(user), notice: t("devise.sessions.guest_signed_in")
  end
end
