class AdminController < ApplicationController
    layout 'admin'  
    def index
      if admin_user_signed_in?

      else
        redirect_to new_admin_user_session_path
      end
    end
    
    def dashboard

    end
  end
  
