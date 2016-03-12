class SmsController < ApplicationController
  before_action :load_refugees_by_tags

  def create
    @refugees.each { |refugee| SmsSender.send(refugee, "some_message") }
  end

  private

  def load_refugees_by_tags
    @refugees = Refugee.includes(:roles).where(roles: {name: params[:tags]})
  end
end
