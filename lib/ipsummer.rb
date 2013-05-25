require_relative 'ipsummer/paragraph.rb'
require_relative 'ipsummer/paragraph_text.rb'
require_relative 'ipsummer/headline.rb'

class Ipsummer
  def self.paragraph(options={})
    paragraph = ParagraphText.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    Paragraph.new(paragraph: paragraph, links: links).unwrapped_paragraph
  end

  def self.rails_wrapped_paragraph(options={})
    paragraph = ParagraphText.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    Paragraph.new(paragraph: paragraph, links: links).rails_wrapped_paragraph
  end

  def self.headline(options={})
    Headline.new(options).complete_text
  end
end
