require 'spec_helper'
require_relative '../text_paragraph.rb'

describe TextParagraph do
  describe '#wrapped_text' do
    it 'returns a text paragraph' do
      paragraph = Paragraph.new
      text_paragraph = TextParagraph.new paragraph

      text_paragraph.wrapped_text.should_not match /^(%p\n)/
      text_paragraph.wrapped_text.should_not match /^(<p>.*<\/p>)$/
    end
  end
end
