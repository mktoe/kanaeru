class PagesController < ApplicationController
  
  #before_action :sign_in_required, only: [:show]

  #layout 'index'

  def index
    if user_signed_in?
      redirect_to("/visions")
    end
  end

  def precomplete
  end

end
