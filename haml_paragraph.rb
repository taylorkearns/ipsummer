require_relative 'paragraph.rb'
require_relative 'text.rb'

class HamlParagraph < Paragraph
  private

  def wrap(str)
    "%p= #{str}"
  end
end
