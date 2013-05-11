require 'spec_helper'
require_relative '../text_paragraph.rb'

describe TextParagraph do
  describe '#wrapped_paragraph' do
    it 'returns a text paragraph' do
      paragraph = Paragraph.new
      text_paragraph = TextParagraph.new paragraph: paragraph

      text_paragraph.wrapped_paragraph.should_not match /^(%p\n)/
      text_paragraph.wrapped_paragraph.should_not match /^(<p>.*<\/p>)$/
    end
  end
end
