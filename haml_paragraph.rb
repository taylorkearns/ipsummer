require_relative 'paragraph.rb'
require_relative 'modules/linkable'

class HamlParagraph
  include Linkable

  attr_reader :paragraph, :links

  def initialize(paragraph, options={})
    @paragraph = paragraph
    @links = options[:links]

    puts wrapped_text
  end

  def wrapped_text
    "%p\n\s\s#{complete_paragraph}"
  end

  private

  def complete_paragraph
    return linked_paragraph if links?
    paragraph.text
  end

  def linked_words(w)
    "\n\s\s%a\s#{w}\n"
  end
end
