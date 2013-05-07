require_relative 'paragraph.rb'
require_relative 'linker.rb'
require_relative 'html_wrapper'

class HtmlParagraph
  attr_reader :paragraph, :links

  def initialize(options={})
    @paragraph = options[:paragraph]
    @links = options[:links]

    puts wrapped_paragraph
  end

  def wrapped_paragraph
    "<p>#{complete_paragraph}</p>"
  end

  private

  def complete_paragraph
    if links?
      Linker.new(paragraph: paragraph, wrapper: HtmlWrapper.new).linked_paragraph
    else
      paragraph.text
    end
  end

  def links?
    links || false
  end
end

HtmlParagraph.new(paragraph: Paragraph.new)
HtmlParagraph.new(paragraph: Paragraph.new, links: true)
