require 'spec_helper'
require_relative '../haml_paragraph.rb'

describe HamlParagraph do
  describe '#complete_paragraph' do
    it 'returns a HAML paragraph' do
      haml_p = HamlParagraph.new

      haml_p.complete_paragraph.should match /^(%p\s)/
    end

    it 'returns a HAML paragraph with links if links kwarg is passed' do
      haml_p = HamlParagraph.new links: true

      haml_p.complete_paragraph.should match /\n\s\s%a\s/
    end
  end
end
