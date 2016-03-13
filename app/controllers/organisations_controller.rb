class OrganisationsController < ApplicationController
  def index ; end

  def edit ; end

  def update
    @current_organisation.update!(organisation_params)

    redirect_to edit_organisation_path(@current_organisation)
  end

  def new
    @organisation = Organisation.new
  end

  def create
    organisation = Organisation.new(params[:organisation])

    if organisation.save
      redirect_to organisation_path(organisation), notice: ""
    else
      redirect_to root_path, alert: ""
    end
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :phone_number)
  end
end
