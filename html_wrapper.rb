class HtmlWrapper
  attr_accessor :linked_words

  def linked_words(w)
    "<a>#{w}</a>"
  end
end
