require_relative 'text.rb'

class Headline
  attr_reader :min_words, :max_words, :period

  def initialize(options={})
    @min_words = options[:min_words]
    @max_words = options[:max_words]
    @period = options[:period] || false

    puts complete_text
  end

  def complete_text
    if period
      titleize(words).join(' ') + '.'
    else
      titleize(words).join(' ')
    end
  end

  private

  def length
    if min_words_no_max_words?
      if min_words > default_max_words
        rand min_words..high_limit_words
      else
        rand min_words..default_max_words
      end
    elsif max_words_no_min_words?
      if max_words < default_min_words
        rand low_limit_words..max_words
      else
        rand default_min_words..max_words
      end
    elsif min_and_max_words?
      if min_words <= max_words
        rand min_words..max_words
      else
        rand default_min_words..default_max_words
      end
    else
      rand default_min_words..default_max_words
    end
  end

  def default_min_words
    3
  end

  def default_max_words
    5
  end

  def low_limit_words
    1
  end

  def high_limit_words
    100
  end

  def min_words_no_max_words?
    !min_words.nil? && max_words.nil?
  end

  def max_words_no_min_words?
    !max_words.nil? && min_words.nil?
  end

  def min_and_max_words?
    !min_words.nil? && !max_words.nil?
  end

  def titleize(words)
    words.map(&:capitalize)
  end

  def words
    Text.new.words.first length
  end
end
