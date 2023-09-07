class ApplicationController < ActionController::Base
  #Deviseコントローラーでリクエストが処理される前に configure_permitted_parameters メソッドを呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #sign_upの際に、ユーザー名(name)のデータ操作を許可
  end
end
