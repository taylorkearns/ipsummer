require_relative 'text.rb'
require_relative 'lengthable.rb'

class Headline
  include Lengthable

  attr_reader :level, :min, :max, :period

  def initialize(options={})
    @level = options[:level]
    @min = options[:min_words]
    @max = options[:max_words]
    @period = options[:period] || false
  end

  def wrapped_headline
    unescaped "<#{heading}>#{unwrapped_headline}</#{heading}>"
  end

  def unwrapped_headline
    complete_headline
  end

  private

  def complete_headline
    if period
      titleize(words).join(' ') + '.'
    else
      titleize(words).join(' ')
    end
  end

  def heading
    if (1..level_limit).include? level
      "h#{level}"
    elsif !level.nil? && level > level_limit
      "h#{level_limit}"
    else
      "h1"
    end
  end

  def level_limit
    6
  end

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

  def unescaped(str)
    if str.respond_to? :html_safe
      str.html_safe
    else
      str
    end
  end
end
