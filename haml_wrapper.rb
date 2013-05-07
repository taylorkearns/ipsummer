class HamlWrapper
  attr_accessor :linked_words

  def linked_words(w)
    "\n\s\s%a\s#{w}\n"
  end
end
