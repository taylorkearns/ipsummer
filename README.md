[![Code Climate](https://codeclimate.com/github/taylorkearns/ipsummer.png)](https://codeclimate.com/github/taylorkearns/ipsummer)

# Ipsummer

Inject dynamic lorem ipsum directly into your markup with customized length and link options.

## Installation

Add this line to your application's Gemfile:

    gem 'ipsummer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipsummer

## Usage

Create a paragraph by calling `Ipsummer.paragraph`. To customize the number of sentences in the paragraph, pass the `min_sentences` and/or `max_sentences` argument. To add links into the text, pass `links: true`.

    <%= Ipsummer.paragraph %>

    <%= Ipsummer.paragraph min_sentences: 8 %>

    = Ipsummer.paragraph links: true

    = Ipsummer.paragraph min_sentences: 3, max_sentences: 5, links: true

If you only want the paragraph content but not the wrapping `<p>` tags, call `Ipsummer.unwrapped_paragraph`.

    <p>
      <strong><%= Ipsummer.unwrapped_paragraph %></strong>
    </p>

    %p
      %em= Ipsummer.unwrapped_paragraph min_sentences: 8

Create a headline by calling `Ipsummer.headline`. To specify the heading level, pass the level number (1-6) to `level`. To customize the number of words in the headline, pass the `min_words` and/or `max_words` argument. To add a period at the end of the headline, pass `period: true`.

    <%= Ipsummer.headline %>

    <%= Ipsummer.headline min_words: 3, max_words: 4 %>

    = Ipsummer.headline level: 3

    = Ipsummer.headline level: 2, period: true, min_words: 3

If you only want the headline content but not the wrapping `<h*>` tags, call `Ipsummer.unwrapped_headline`.

    <h2>
      <quote><%= Ipsummer.unwrapped_headline min_words: 3, max_words: 4 %></quote>
    </h2>

    %li= Ipsummer.unwrapped_headline level: 3, period: true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
