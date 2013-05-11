require_relative 'paragraph.rb'

class TextParagraph
  attr_reader :paragraph

  def initialize(options={})
    @paragraph = options[:paragraph]

    puts wrapped_paragraph
  end

  def wrapped_paragraph
    paragraph.text
  end
end
