require_relative 'text.rb'

class Ipsum
  def self.paragraphs(args={})
    Paragraphs.new(args).generate
  end
end

class Paragraphs
  attr_reader :count, :min_sentences, :max_sentences, :links

  def initialize(args)
    @count = args[:count] || 1
    @min_sentences = args[:min_sentences] || 2
    @max_sentences = args[:max_sentences] || 5
    @links = args[:links] || false
  end

  def generate
    text = Text.new.generate
  end

  private

  def length
    rand min_sentences..max_sentences
  end
end

result = Ipsum.paragraphs
p result
