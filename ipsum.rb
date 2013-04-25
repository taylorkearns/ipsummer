require_relative 'haml_paragraph.rb'
require_relative 'html_paragraph.rb'

class Ipsum
  def paragraph(options={})
    Paragraph.new(options).generate
  end

  def html_paragraph(options={})
    HtmlParagraph.new(options).generate
  end

  def haml_paragraph(options={})
    HamlParagraph.new(options).generate
  end
end

ipsum = Ipsum.new
paragraph = ipsum.paragraph
haml_paragraph = ipsum.haml_paragraph
html_paragraph = ipsum.html_paragraph
