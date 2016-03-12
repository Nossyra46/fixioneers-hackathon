class SessionsController < ApplicationController
  skip_before_action :load_organisation, except: [:destroy]

  def new ; end

  def create
    organisation = Organisation.find_by(email: params[:email], password: params[:password])

    if organisation
      session[:organisation_id] = organisation.id
    else
      redirect_to root_path, alert: ""
    end
  end

  def destroy
    session[:organisation_id] = nil

    redirect_to root_path, notice: ""
  end
end
