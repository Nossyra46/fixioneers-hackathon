class RefugeesController < ApplicationController
  def create
    Refugee.create(params[:refugee])
  end
end
