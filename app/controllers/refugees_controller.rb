class RefugeesController < ApplicationController
  layout 'connected'

  before_action :load_refugee, except: [:index, :new, :create]

  def index
    @refugees = current_organisation.refugees
  end

  def edit ; end

  def update
    refugee.update(params[:refugee])
  end

  def create
    RefugeeImporter.import(current_organisation)

    redirect_to refugees_path
  end

  private

  def load_refugee
    @refugee = current_organisation.refugees.find(params[:id])
  end
end
