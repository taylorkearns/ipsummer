class Linker
  attr_accessor :paragraph_text, :wrapper

  def initialize(options={})
    @paragraph_text = options[:paragraph_text]
    @wrapper = options[:wrapper]
  end

  def linked_paragraph
    phrases.map { |phrase| phrase_with_link phrase }
      .join(' ').gsub(/\w\z/, 't.').gsub(/>\z/, '>.')
  end

  private

  def phrases
    phrases = []
    remaining_words = words
    until remaining_words.empty? do
      phrases << remaining_words.slice!(0, break_point)
    end
    phrases.map { |phrase| phrase.join(' ') }
  end

  def phrase_with_link(phrase)
    phrase_words = phrase.split
    position = rand phrase_words.count
    length = [1, 2, 3].sample
    selected_words = phrase_words[position, length].join(' ').gsub(/[,\?!]/, '')
    phrase_words[position, length] = linked_words(selected_words)
    phrase_words.join(' ').gsub(/\.<\/a>/, '</a>.')
  end

  def break_point
    words.count/link_count
  end

  def link_count
    link_count = (words.count/20.0).ceil
  end

  def words
    paragraph_text.text.split
  end

  def linked_words(w)
    wrapper.linked_words w
  end
end
