require 'ipsummer/version'
require 'ipsummer/paragraph.rb'
require 'ipsummer/haml_paragraph.rb'
require 'ipsummer/html_paragraph.rb'
require 'ipsummer/text_paragraph.rb'
require 'ipsummer/headline.rb'

class Ipsum
  def self.text_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])

    TextParagraph.new(paragraph: paragraph).wrapped_paragraph
  end

  def self.html_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    HtmlParagraph.new(paragraph: paragraph, links: links).wrapped_paragraph
  end

  def self.haml_paragraph(options={})
    paragraph = Paragraph.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    HamlParagraph.new(paragraph: paragraph, links: links).wrapped_paragraph
  end

  def self.headline(options={})
    Headline.new(options).complete_text
  end
end
