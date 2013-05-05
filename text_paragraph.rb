require_relative 'paragraph.rb'

class TextParagraph
  attr_reader :paragraph

  def initialize(paragraph, options={})
    @paragraph = paragraph

    puts wrapped_text
  end

  def wrapped_text
    paragraph.text
  end
end
