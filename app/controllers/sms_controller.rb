class SmsController < ApplicationController
  before_action :load_refugees_by_tags

  def create
    @refugees.each { |refugee| SmsSender.send(refugee, translated_message_for(refugee)) }
  end

  private

  def translated_message_for(refugee)
    MessageTranslator.translate(params[:message], refugee.locale)
  end

  def load_refugees_by_tags
    @refugees = Refugee.includes(:roles).where(roles: {name: params[:tags]})
  end
end
