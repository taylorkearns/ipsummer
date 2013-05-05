require_relative 'paragraph.rb'

class HtmlParagraph
  attr_reader :paragraph, :links

  def initialize(paragraph, options={})
    @paragraph = paragraph
    @links = options[:links]

    puts wrapped_text
  end

  def wrapped_text
    "<p>#{complete_paragraph}</p>"
  end

  private

  def complete_paragraph
    return linked_paragraph if links?
    paragraph.text
  end

  def links?
    links || false
  end

  def linked_paragraph
    linked_paragraph = phrases.map { |phrase| phrase_with_link phrase }.join(' ').gsub(/\w\z/, 't.')
  end

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
    selected_words = phrase_words[position, length].join(' ').gsub(/[\.,\?!]/, '')
    phrase_words[position, length] = linked_words(selected_words)
    phrase_words.join(' ')
  end

  def linked_words(w)
    "<a>#{w}</a>"
  end

  def break_point
    words.count/link_count
  end

  def link_count
    link_count = (words.count/20.0).ceil
  end

  def words
    paragraph.words
  end
end
