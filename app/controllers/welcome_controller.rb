class WelcomeController < ApplicationController
  skip_before_action :load_organisation

  def index
  end
end
