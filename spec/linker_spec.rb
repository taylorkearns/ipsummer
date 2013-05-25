require 'spec_helper'
require_relative '../lib/ipsummer/linker.rb'
require_relative '../lib/ipsummer/paragraph_text.rb'

describe Linker do
  it 'returns an HTML paragraph with links' do
    paragraph_text = ParagraphText.new
    linker = Linker.new(paragraph_text: paragraph_text, wrapper: HtmlWrapper.new)

    linker.linked_paragraph.should match /(<a>.*<\/a>)/
  end
end
