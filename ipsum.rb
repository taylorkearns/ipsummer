require_relative 'paragraph.rb'
require_relative 'text_paragraph.rb'
require_relative 'haml_paragraph.rb'
require_relative 'html_paragraph.rb'
require_relative 'headline.rb'

class Ipsum
  def self.text_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])

    TextParagraph.new(paragraph: paragraph)
  end

  def self.html_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    HtmlParagraph.new(paragraph: paragraph, links: links)
  end

  def self.haml_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    HamlParagraph.new(paragraph: paragraph, links: links)
  end

  def self.headline(options={})
    Headline.new(options).complete_text
  end
end
