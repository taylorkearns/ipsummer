class Text
  attr_reader :source, :path

  def sentences
    randomize(File.read(path))
  end

  private

  def randomize(string)
    string.split(/\.\s/).shuffle.join('. ') + '.'
  end

  def path
    File.expand_path "text/#{source}"
  end

  def source
    'lorem-ipsum.txt'
  end
end
