require 'spec_helper'
require_relative '../lib/ipsummer/html_paragraph.rb'

describe HtmlParagraph do
  describe '#wrapped_paragraph' do
    it 'returns an HTML paragraph' do
      paragraph = Paragraph.new
      html_paragraph = HtmlParagraph.new(paragraph: paragraph)

      html_paragraph.wrapped_paragraph.should match /^<p>.*<\/p>$/
    end
  end
end
