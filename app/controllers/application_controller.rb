class ApplicationController < ActionController::Base
  #ログイン認証が成功していないと、
  #トップページ以外の画面（ログインと新規登録は除く）は表示できない仕様
  before_action :authenticate_user!, except: [:top]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end