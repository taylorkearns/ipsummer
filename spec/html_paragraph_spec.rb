require 'spec_helper'
require_relative '../html_paragraph.rb'

describe HtmlParagraph do
  describe '#html' do
    it 'returns an HTML paragraph' do
      html_p = HtmlParagraph.new

      html_p.html.should match /^(<p>.*<\/p>)$/
    end
  end
end
