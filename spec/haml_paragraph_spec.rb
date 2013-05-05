require 'spec_helper'
require_relative '../haml_paragraph.rb'

describe HamlParagraph do
  describe '#wrapped_text' do
    it 'returns a HAML paragraph' do
      paragraph = Paragraph.new
      haml_paragraph = HamlParagraph.new paragraph

      haml_paragraph.wrapped_text.should match /^(%p\n)/
    end

    it 'returns a HAML paragraph with links if links kwarg is passed' do
      paragraph = Paragraph.new
      haml_paragraph = HamlParagraph.new paragraph, links: true

      haml_paragraph.wrapped_text.should match /\n\s\s%a\s/
    end
  end
end
