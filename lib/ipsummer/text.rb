require_relative 'text_source'

class Text
  include TextSource

  attr_reader :source

  def sentences
    randomize_sentences source
  end

  def words
    randomize_words source
  end

  private

  def randomize_sentences(string)
    string.split(/\.\s/).shuffle
  end

  def randomize_words(string)
    string.gsub(/[\.,\?]/, '').split().shuffle
  end

  def source
    lorem_ipsum
  end
end
