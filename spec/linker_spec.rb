require 'spec_helper'
require_relative '../linker.rb'
require_relative '../haml_wrapper.rb'

describe Linker do
  describe '#linked_paragraph' do
    context 'with a HAML paragraph' do
      it 'returns a HAML paragraph with links' do
        paragraph = Paragraph.new
        linker = Linker.new(paragraph: paragraph, wrapper: HamlWrapper.new)

        linker.linked_paragraph.should match /\n\s\s%a\s/
      end
    end

    context 'with an HTML paragraph' do
      it 'returns an HTML paragraph with links' do
        paragraph = Paragraph.new
        linker = Linker.new(paragraph: paragraph, wrapper: HtmlWrapper.new)

        linker.linked_paragraph.should match /(<a>.*<\/a>)/
      end
    end
  end
end
