require_relative 'paragraph.rb'

class HtmlParagraph
  attr_accessor :paragraph, :min_sentences, :max_sentences

  def initialize(options={})
    @min_sentences = options[:min_sentences] || 5
    @max_sentences = options[:max_sentences] || 10
    @paragraph = Paragraph.new(min_sentences: min_sentences, max_sentences: max_sentences).paragraph
  end

  def html
    "<p>#{paragraph}</p>"
  end
end
