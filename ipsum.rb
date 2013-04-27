require_relative 'haml_paragraph.rb'
require_relative 'html_paragraph.rb'

class Ipsum
  def paragraph(options={})
    Paragraph.new(options).generate
  end
  alias :p :paragraph

  def html_paragraph(options={})
    HtmlParagraph.new(options).generate
  end
  alias :htmlp :html_paragraph

  def haml_paragraph(options={})
    HamlParagraph.new(options).generate
  end
  alias :hamlp :haml_paragraph
end

ipsum = Ipsum.new
p = ipsum.p
hamlp = ipsum.hamlp
htmlp = ipsum.htmlp
