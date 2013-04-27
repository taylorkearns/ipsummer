require 'spec_helper'
require_relative '../haml_paragraph.rb'

describe HamlParagraph do
  describe '#haml' do
    it 'returns a HAML paragraph' do
      haml_p = HamlParagraph.new

      haml_p.haml.should match /^(%p=)/
    end
  end
end
