require_relative 'text.rb'
require_relative 'lengthable.rb'

class Headline
  include Lengthable

  attr_reader :min, :max, :period

  def initialize(options={})
    @min = options[:min_words]
    @max = options[:max_words]
    @period = options[:period] || false

    complete_text
  end

  def complete_text
    if period
      titleize(words).join(' ') + '.'
    else
      titleize(words).join(' ')
    end
  end

  private

  def default_min
    3
  end

  def default_max
    5
  end

  def low_limit
    1
  end

  def high_limit
    100
  end

  def titleize(words)
    words.map(&:capitalize)
  end

  def words
    Text.new.words.first length
  end
end
