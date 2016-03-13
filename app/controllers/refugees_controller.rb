class RefugeesController < ApplicationController
  before_action :load_refugee, except: [:index, :new, :create]

  def index
    @refugees = current_organisation.refugees
  end

  def new
    @refugee = Refugee.new
  end

  def edit ; end

  def update
    refugee.update(params[:refugee])
  end

  def create
    Refugee.create(params[:refugee])
  end

  private

  def load_refugee
    @refugee = current_organisation.refugees.find(params[:id])
  end
end
