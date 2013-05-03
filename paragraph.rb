require_relative 'text.rb'

module Paragraph
  attr_reader :min_sentences, :max_sentences, :text, :links

  def wrapped_paragraph
    paragraph
  end

  private

  def paragraph
    return linked_paragraph if links?
    plain_paragraph
  end

  def linked_paragraph
    linked_paragraph = phrases.map { |phrase| phrase_with_link phrase }.join(' ').gsub(/\w\z/, 't.')
    wrapped_paragraph(linked_paragraph)
  end

  def phrases
    phrases = []
    remaining_words = words
    link_count.times do
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

  def break_point
    words.count/link_count
  end

  def link_count
    link_count = (words.count/20).ceil
  end

  def words
    paragraph.split
  end

  def links?
    links || false
  end

  def initial_paragraph
    sentences.split(/\.\s/).first(length).join('. ') + '.'
  end

  def length
    rand min_sentences..max_sentences
  end

  def sentences
    Text.new.sentences
  end

  def plain_paragraph
    initial_paragraph
  end

  def wrapped_paragraph(p)
    p
  end

  def linked_words(w)
    w
  end
end
