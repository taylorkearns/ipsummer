class Text
  attr_reader :output

  def initialize(title)
    @file = File.expand_path "text/#{title}.txt"
  end

  def output
    File.read @file
  end
end
