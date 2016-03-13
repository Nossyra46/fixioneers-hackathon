class SessionsController < ApplicationController
  skip_before_action :load_current_organisation, except: [:destroy]

  def create
    organisation = Organisation.find_by(params[:organisation])

    if organisation
      session[:organisation_id] = organisation.id

      render status: :ok, json: {name: organisation.name}
    else
      head :unauthorized
    end
  end

  def destroy
    session[:organisation_id] = nil

    redirect_to root_path, notice: ""
  end
end
