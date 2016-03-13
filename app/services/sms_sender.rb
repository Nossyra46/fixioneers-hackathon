class SmsSender
  attr_reader :user, :message, :organisation

  def initialize(user, organisation, message)
    @user = user
    @message = message
    @organisation = organisation
  end

  def self.send(user, organisation, message)
    new(user, organisation, message).send
  end

  def send
    if send_message
      true
    else
      [false, :verification_code_delivery_failure]
    end
  end

  private

  def send_message
    twilio_client.account.messages.create(
      from: organisation.name.upcase,
      to: user.phone_number,
      body: message
    )
  rescue Twilio::REST::RequestError
    false
  end

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_API_KEY'])
  end
end
