require_relative 'paragraph.rb'
require_relative 'text.rb'

class HtmlParagraph < Paragraph
  private

  def wrap(str)
    "<p>#{str}</p>"
  end
end

