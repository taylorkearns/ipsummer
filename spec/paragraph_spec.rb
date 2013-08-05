require 'spec_helper'
require_relative '../lib/ipsummer/paragraph.rb'
require_relative '../lib/ipsummer/paragraph_text.rb'

describe Paragraph do
  describe '#wrapped_paragraph' do
    context 'when html_safe is not defined' do
      it 'returns an HTML paragraph' do
        paragraph_text = ParagraphText.new
        paragraph = Paragraph.new(paragraph_text: paragraph_text)

        paragraph.wrapped_paragraph.should match /<p>.*\.<\/p>$/
      end
    end

    context 'when html_safe is defined' do
      it 'returns an HTML paragraph' do
        complete_paragraph = ''

        def complete_paragraph.html_safe
          'Text and <a href="#">a link</a>.'
        end

        paragraph_text = ParagraphText.new
        paragraph = Paragraph.new(paragraph_text: paragraph_text)

        paragraph.should_receive(:complete_paragraph).and_return complete_paragraph
        paragraph.unwrapped_paragraph.should == 'Text and <a href="#">a link</a>.'
      end
    end
  end
end
