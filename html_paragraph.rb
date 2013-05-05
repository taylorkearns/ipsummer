require_relative 'paragraph.rb'
require_relative 'modules/linkable'

class HtmlParagraph
  include Linkable

  attr_reader :paragraph, :links

  def initialize(paragraph, options={})
    @paragraph = paragraph
    @links = options[:links]

    puts wrapped_text
  end

  def wrapped_text
    "<p>#{complete_paragraph}</p>"
  end

  private

  def complete_paragraph
    return linked_paragraph if links?
    paragraph.text
  end

  def linked_words(w)
    "<a>#{w}</a>"
  end
end
