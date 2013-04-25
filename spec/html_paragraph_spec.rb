require 'spec_helper'
require_relative '../html_paragraph.rb'

describe HtmlParagraph do
  it 'is wrapped in an HTML paragraph tag' do
    html_p = HtmlParagraph.new

    html_p.generate.should match /^(<p>.*<\/p>)$/
  end
end
