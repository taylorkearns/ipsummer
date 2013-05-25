require_relative 'linker.rb'
require_relative 'html_wrapper'

class Paragraph
  attr_reader :paragraph, :links

  def initialize(options={})
    @paragraph = options[:paragraph]
    @links = options[:links]
  end

  def unwrapped_paragraph
    complete_paragraph
  end

  def rails_wrapped_paragraph
    "raw(<p>#{complete_paragraph}</p>)"
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
