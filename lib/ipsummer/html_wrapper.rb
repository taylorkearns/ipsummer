class HtmlWrapper
  attr_accessor :linked_words

  def linked_words(w)
    %(<a href="#">#{w}</a>)
  end
end
