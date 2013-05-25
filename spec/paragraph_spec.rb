require 'spec_helper'
require_relative '../lib/ipsummer/paragraph.rb'
require_relative '../lib/ipsummer/paragraph_text.rb'

describe Paragraph do
  describe '#rails_wrapped_paragraph' do
    it 'returns an HTML paragraph' do
      paragraph_text = ParagraphText.new
      paragraph = Paragraph.new(paragraph_text: paragraph_text)

      paragraph.rails_wrapped_paragraph.should match /^raw\(<p>.*<\/p>\)$/
    end
  end
end
