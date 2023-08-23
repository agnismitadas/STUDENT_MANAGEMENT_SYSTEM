class WelcomeController < ApplicationController
    skip_before_action :authenticate_admin_user!

    def index
    end
end
