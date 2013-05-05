require 'spec_helper'
require_relative '../html_paragraph.rb'

describe HtmlParagraph do
  describe '#wrapped_text' do
    it 'returns an HTML paragraph without links when no links kwarg is passed' do
      paragraph = Paragraph.new
      html_paragraph = HtmlParagraph.new(paragraph)

      html_paragraph.wrapped_text.should match /^(<p>.*<\/p>)$/
    end

    it 'returns an HTML paragraph with links when a links kwarg is passed' do
      paragraph = Paragraph.new
      html_paragraph = HtmlParagraph.new(paragraph, links: true)

      html_paragraph.wrapped_text.should match /^(<p>.*<\/p>)$/
      html_paragraph.wrapped_text.should match /(<a>.*<\/a>)/
    end
  end
end
