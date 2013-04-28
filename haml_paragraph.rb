require_relative 'paragraph.rb'

class HamlParagraph
  attr_accessor :paragraph, :links

  def initialize(options={})
    @paragraph = Paragraph.new(min_sentences: options[:min_sentences], max_sentences: options[:max_sentences]).paragraph
    @links = options[:links]
  end

  def haml
    if links?
      return "%p\s\n\s\s#{paragraph_with_links}"
    end

    "%p\s#{paragraph}"
  end

  private

  def links?
    links || false
  end

  def paragraph_with_links
    phrases.map { |phrase| phrase_with_link phrase }.join(' ').gsub(/\w\z/, 't.')
  end

  def phrase_with_link(phrase)
    words = phrase.split
    position = rand words.count
    length = [1, 2, 3].sample
    words[position, length] = "\n\s\s%a\s#{words[position, length].join(' ').gsub(/[\.,\?!]/, '')}\n"
    words.join(' ')
  end

  def phrases
    phrases = []
    remaining_words = words
    link_count.times do
      phrases << remaining_words.slice!(0, break_point)
    end
    phrases.map { |phrase| phrase.join(' ') }
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
end
