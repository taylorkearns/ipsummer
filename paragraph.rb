require_relative 'text.rb'

class Paragraph
  attr_reader :min_sentences, :max_sentences, :text

  def initialize(options={})
    @min_sentences = options[:min_sentences] || 5
    @max_sentences = options[:max_sentences] || 10
  end

  def paragraph
    sentences.split(/\.\s/).first(length).join('. ') + '.'
  end

  def length
    rand min_sentences..max_sentences
  end

  private

  def sentences
    Text.new.sentences
  end
end
