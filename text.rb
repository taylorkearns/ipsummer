class Text
  attr_reader :source, :path

  def sentences
    randomize_sentences(File.read(path))
  end

  def words
    randomize_words(File.read(path))
  end

  private

  def randomize_sentences(string)
    string.split(/\.\s/).shuffle
  end

  def randomize_words(string)
    string.gsub(/[\.,\?]/, '').split().shuffle
  end

  def path
    File.expand_path "text/#{source}"
  end

  def source
    'lorem-ipsum.txt'
  end
end
