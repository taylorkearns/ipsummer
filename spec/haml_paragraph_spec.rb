require 'spec_helper'
require_relative '../lib/ipsummer/haml_paragraph.rb'

describe HamlParagraph do
  describe '#wrapped_paragraph' do
    it 'returns a HAML paragraph' do
      paragraph = Paragraph.new
      haml_paragraph = HamlParagraph.new paragraph: paragraph

      haml_paragraph.wrapped_paragraph.should match /^%p\n\s\s.+$/
    end
  end
end
