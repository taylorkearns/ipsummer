require 'rubygems'
require 'action_view'
require_relative 'linker.rb'
require_relative 'html_wrapper'

class Paragraph
  attr_reader :paragraph_text, :links

  def initialize(options={})
    @paragraph_text = options[:paragraph_text]
    @links = options[:links]
  end

  def unwrapped_paragraph
    raw complete_paragraph
  end

  def wrapped_paragraph
    raw "<p>#{complete_paragraph}</p>"
  end

  private

  def complete_paragraph
    if links?
      Linker.new(paragraph_text: paragraph_text, wrapper: HtmlWrapper.new).linked_paragraph
    else
      paragraph_text.text
    end
  end

  def links?
    links || false
  end
end
