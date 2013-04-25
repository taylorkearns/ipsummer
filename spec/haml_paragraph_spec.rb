require 'spec_helper'
require_relative '../haml_paragraph.rb'

describe HamlParagraph do
  it 'is prefixed by a HAML paragraph tag' do
    haml_p = HamlParagraph.new

    haml_p.generate.should match /^(%p=)/
  end
end
