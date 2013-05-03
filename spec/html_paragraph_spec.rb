require 'spec_helper'
require_relative '../html_paragraph.rb'

describe HtmlParagraph do
  describe '#complete_paragraph' do
    it 'returns an HTML paragraph' do
      html_p = HtmlParagraph.new

      html_p.complete_paragraph.should match /^(<p>.*<\/p>)$/
    end
  end
end
