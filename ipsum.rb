class Ipsum
  def self.paragraphs(options={})
    ParagraphGenerator.new(options).generate 
  end
end

class ParagraphGenerator
  attr_reader :count, :min_length, :max_length, :links

  def initialize(options)
    @count = options[:count] || 1
    @min_length = options[:min_length] || 300
    @max_length = options[:max_length] || 600
    @links = options[:links] || false
  end

  def generate
    { count: count, min_length: min_length, max_length: max_length, links: links }
  end
end

result = Ipsum.paragraphs count: 3, min_length: 200, max_length: 500, links: true
p result
