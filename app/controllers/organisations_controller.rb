class OrganisationsController < ApplicationController
  before_action :load_organisation

  def index ; end

  def edit ; end

  def update
    @organisation = Organisation.update!(params[:organisation])
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

  def load_organisation
    @organisation = Organisation.find(params[:id])
  end
end
