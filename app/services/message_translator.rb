class MessageTranslator
  attr_reader :message, :locale

  def initialize(message, locale)
    @message = message
    @locale = locale
  end

  def self.translate(message, locale)
    new(message, locale).translate
  end

  def translate
    translated_message
  end

  private

  def translated_message
    translator.translate(message, :from => 'fr', :to => locale)
  end

  def translator
    @translator ||= BingTranslator.new('hackaheetch', 'aJsZ8wN2cPaf2FMVIa0Z7L0oJ5hXTGqxBgPdb5RX7rg=')
  end
end
