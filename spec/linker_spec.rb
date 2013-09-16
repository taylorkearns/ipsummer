require 'spec_helper'
require_relative '../lib/ipsummer/linker.rb'
require_relative '../lib/ipsummer/paragraph_text.rb'

describe Linker do
  describe '#linked_paragraph' do
    before do
      @paragraph_text = ParagraphText.new
      @linker = Linker.new(paragraph_text: @paragraph_text, wrapper: HtmlWrapper.new)
    end

    it 'returns an HTML paragraph with links' do
      @linker.linked_paragraph.should match /(<a href="#">.*<\/a>)/
    end

    it 'ends in a period' do
      @linker.linked_paragraph.should match /\.\z/
    end
  end
end
