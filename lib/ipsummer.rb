require_relative 'ipsummer/paragraph.rb'
require_relative 'ipsummer/paragraph_text.rb'
require_relative 'ipsummer/headline.rb'

class Ipsummer
  def self.paragraph(options={})
    paragraph_text = ParagraphText.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    Paragraph.new(paragraph_text: paragraph_text, links: links).unwrapped_paragraph
  end

  def self.rails_paragraph(options={})
    paragraph_text = ParagraphText.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    Paragraph.new(paragraph_text: paragraph_text, links: links).rails_paragraph
  end

  def self.headline(options={})
    Headline.new(options).complete_text
  end
end
