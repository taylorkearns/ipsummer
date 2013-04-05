require 'debugger'
require_relative 'text.rb'

class ParagraphGenerator
  MINIMUM_CHARACTER_COUNT = 300

  attr_reader :output

  def initialize(count)
    title = 'lorem-ipsum'
    @count = count
    @text = Text.new(title).output.split /\n\n/
  end

  def output
    size_filtered_text.shuffle.first @count
  end

  private

  def size_filtered_text
    @text.delete_if { |line| line.length < MINIMUM_CHARACTER_COUNT }
  end
end
