require 'debugger'
require 'spec_helper'
require_relative '../ipsum.rb'

describe HamlParagraph do
  it 'is prefixed by a HAML paragraph tag' do
    haml_p = HamlParagraph.new

    haml_p.generate

    haml_p.should match /^(%p=)/
  end
end
