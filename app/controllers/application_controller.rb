class ApplicationController < ActionController::Base
  # ユーザーのページに行く前に以下を実行します
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップの時にユーザーネームを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
