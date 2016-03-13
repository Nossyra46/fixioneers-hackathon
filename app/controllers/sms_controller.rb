class SmsController < ApplicationController
  before_action :load_refugees_by_tags, only: :create
  before_action :load_refugee, only: :single_message

  def create
    @refugees.each { |refugee| SmsSender.send(refugee, current_organisation, translated_message_for(refugee)) }

    redirect_to refugees_path
  end

  def single_message
    SmsSender.send(@refugee, current_organisation, translated_message_for(@refugee))

    head :no_content
  end

  private

  def load_refugee
    @refugee = current_organisation.refugees.find_by(id: params[:id])
  end

  def translated_message_for(refugee)
    MessageTranslator.translate(params[:message], refugee)
  end

  def load_refugees_by_tags
    @refugees = Refugee.all
    # @refugees = Refugee.includes(:roles).where(roles: {name: params[:tags]})
  end
end
