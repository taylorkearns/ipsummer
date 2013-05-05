require_relative 'paragraph.rb'
require_relative 'text_paragraph.rb'
require_relative 'haml_paragraph.rb'
require_relative 'html_paragraph.rb'

class Ipsum
  def text_paragraph(options={})
    min_sentences = options[:min_sentences]
    max_sentences = options[:max_sentences]

    TextParagraph.new(Paragraph.new(min_sentences: min_sentences, max_sentences: max_sentences))
  end

  def html_paragraph(options={})
    min_sentences = options[:min_sentences]
    max_sentences = options[:max_sentences]
    links = options[:links]

    HtmlParagraph.new(Paragraph.new(min_sentences: min_sentences, max_sentences: max_sentences), links: links)
  end

  def haml_paragraph(options={})
    min_sentences = options[:min_sentences]
    max_sentences = options[:max_sentences]
    links = options[:links]

    HamlParagraph.new(Paragraph.new(min_sentences: min_sentences, max_sentences: max_sentences), links: links)
  end

  private

  def paragraph
    Paragraph.new(options={})
  end
end

ipsum = Ipsum.new
ipsum.html_paragraph links: true
ipsum.haml_paragraph min_sentences: 3, max_sentences: 4
