require_relative 'paragraph.rb'
require_relative 'linker.rb'
require_relative 'haml_wrapper.rb'

class HamlParagraph
  attr_reader :paragraph, :links

  def initialize(options={})
    @paragraph = options[:paragraph]
    @links = options[:links]

    puts wrapped_paragraph
  end

  def wrapped_paragraph
    "%p\n\s\s#{complete_paragraph}"
  end

  private

  def complete_paragraph
    if links?
      Linker.new(paragraph: paragraph, wrapper: HamlWrapper.new).linked_paragraph
    else
      paragraph.text
    end
  end

  def links?
    links || false
  end
end

HamlParagraph.new(paragraph: Paragraph.new)
HamlParagraph.new(paragraph: Paragraph.new, links: true)
