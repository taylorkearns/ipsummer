require_relative 'paragraph.rb'

class HtmlParagraph
  include Paragraph

  def initialize(options={})
    @min_sentences = options[:min_sentences] || 5
    @max_sentences = options[:max_sentences] || 10
    @links = options[:links]
  end

  def wrapped_paragraph(p)
    "<p>#{p}</p>"
  end

  private

  def linked_words(w)
    "<a>#{w}</a>"
  end

  #def plain_paragraph
    #"<p>#{paragraph}</p>"
  #end

  #def complete_paragraph
    #return linked_paragraph if links?
    #plain_paragraph
  #end

  #def links?
    #links || false
  #end

  #def linked_paragraph
    #linked_paragraph = phrases.map { |phrase| phrase_with_link phrase }.join(' ').gsub(/\w\z/, 't.')
    #wrapped_paragraph(linked_paragraph)
  #end

  #def phrase_with_link(phrase)
    #words = phrase.split
    #position = rand words.count
    #length = [1, 2, 3].sample
    #selected_words = words[position, length].join(' ').gsub(/[\.,\?!]/, '')
    #words[position, length] = linked_words(selected_words)
    #words.join(' ')
  #end

  #def phrases
    #phrases = []
    #remaining_words = words
    #link_count.times do
      #phrases << remaining_words.slice!(0, break_point)
    #end
    #phrases.map { |phrase| phrase.join(' ') }
  #end

  #def break_point
    #words.count/link_count
  #end

  #def link_count
    #link_count = (words.count/20).ceil
  #end

  #def words
    #paragraph.split
  #end
end
