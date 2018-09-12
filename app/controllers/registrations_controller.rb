class RegistrationsController < Devise::RegistrationsController

  protected
  
  #メール送信後のリダイレクトページ
  def after_inactive_sign_up_path_for(resource)
    pages_precomplete_path
  end

  def after_sign_up_path_for(resource)
    projects_new_path
  end
end