class WelcomeController < ApplicationController
  skip_before_action :load_current_organisation

  def index
    session[:organisation_id] = nil
  end
end
