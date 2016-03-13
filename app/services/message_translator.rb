class MessageTranslator
  attr_reader :message, :locale, :refugee

  def initialize(message, refugee)
    @message = message
    @refugee = refugee
    @locale = refugee.locale
  end

  def self.translate(message, refugee)
    new(message, refugee).translate
  end

  def translate
    translated_message
  end

  private

  def translated_message
    named_message = message.gsub(/@name/, refugee.first_name)
    translator.translate(named_message, :from => 'fr', :to => locale)
  end

  def translator
    @translator ||= BingTranslator.new('hackaheetch', 'aJsZ8wN2cPaf2FMVIa0Z7L0oJ5hXTGqxBgPdb5RX7rg=')
  end
end
