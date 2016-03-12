class SmsSender
  attr_reader :user, :message

  def initialize(user, message)
    @user = user
    @message = message
  end

  def self.send(user, message)
    new(user, message).send
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
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: user.mobile_phone,
      body: message
    )
  rescue Twilio::REST::RequestError
    false
  end

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_API_KEY'])
  end
end
