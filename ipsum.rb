require_relative 'paragraph.rb'
require_relative 'text_paragraph.rb'
require_relative 'haml_paragraph.rb'
require_relative 'html_paragraph.rb'
require_relative 'headline.rb'

class Ipsum
  def text_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])

    TextParagraph.new(paragraph: paragraph)
  end

  def html_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    HtmlParagraph.new(paragraph: paragraph, links: links)
  end

  def haml_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    HamlParagraph.new(paragraph: paragraph, links: links)
  end

  def headline(options={})
    Headline.new(options).complete_text
  end

  private

  def paragraph
    Paragraph.new(
      min_sentences: options[:min_sentences],
      max_sentences: options[:max_sentences])
  end
end

ipsum = Ipsum.new
ipsum.text_paragraph
ipsum.text_paragraph min_sentences: 3, max_sentences: 4

ipsum.html_paragraph
ipsum.html_paragraph links: true, min_sentences: 3, max_sentences: 4

ipsum.haml_paragraph
ipsum.haml_paragraph min_sentences: 3, max_sentences: 4, links: true

ipsum.headline min_words: 3, max_words: 4
ipsum.headline period: true
