require_relative 'ipsummer/paragraph.rb'
require_relative 'ipsummer/paragraph_text.rb'
require_relative 'ipsummer/headline.rb'

module Ipsummer
  def self.paragraph(options={})
    get_paragraph options, :unwrapped_paragraph
  end

  def self.wrapped_paragraph(options={})
    get_paragraph options, :wrapped_paragraph
  end

  def self.headline(options={})
    Headline.new(options).complete_text
  end

  private

  def self.get_paragraph(options, method)
    paragraph_text = ParagraphText.new(
                  min_sentences: options[:min_sentences],
                  max_sentences: options[:max_sentences])
    links = options[:links]

    Paragraph.new(paragraph_text: paragraph_text, links: links).send method
  end
end
