require_relative 'text.rb'

class Ipsum
  def paragraph(options={})
    Paragraph.new(options).generate
  end
end

class Paragraph
  attr_reader :min_sentences, :max_sentences

  def initialize(options={})
    @min_sentences = options[:min_sentences] || 5
    @max_sentences = options[:max_sentences] || 10
  end

  def generate
    text.split(/\.\s/).first(length).join('. ') + '.'
  end

  private

  def length
    rand min_sentences..max_sentences
  end

  def text
    Text.new.generate
  end
end

ipsum = Ipsum.new
paragraph = ipsum.paragraph
p paragraph
