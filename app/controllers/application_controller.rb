class ApplicationController < ActionController::Base
  #Deviseコントローラーでリクエストが処理される前に configure_permitted_parameters メソッドを呼び出す
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  
  def after_sign_in_path_for(resource)
    about_path
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #sign_upの際に、ユーザー名(name)のデータ操作を許可
  end
end
