require_relative 'text.rb'
require_relative 'lengthable.rb'

class ParagraphText
  include Lengthable

  attr_reader :min, :max

  def initialize(options={})
    @min = options[:min_sentences]
    @max = options[:max_sentences]
  end

  def text
    sentences.first(length).join('. ') + '.'
  end

  private

  def default_min
    5
  end

  def default_max
    10
  end

  def low_limit
    1
  end

  def high_limit
    100
  end

  def sentences
    Text.new.sentences
  end
end
