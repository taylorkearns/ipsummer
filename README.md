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

Create a paragraph (multiple sentences) inside HTML or Haml tags by calling `Ipsummer.paragraph`. To customize the number of sentences in the paragraph, pass the `min_sentences` and/or `max_sentences` argument. To add links into the text, pass `links: true`.

    <p><%= Ipsummer.paragraph %></p>

    <p><%= Ipsummer.paragraph min_sentences: 8 %></p>

    %p= Ipsummer.paragraph links: true

    %p= Ipsummer.paragraph min_sentences: 3, max_sentences: 5

If you are in a Rails view, you may alternatively forgo writing the paragraph tags and instead use the `Ipsummer.rails_paragraph` method. This method incorporates the Rails `raw` helper to escape the HTML.

    <%= Ipsummer.rails_paragraph links: true %>

    = Ipsummer.rails_paragraph max_sentences: 4

Create a headline (a single sentence) inside HTML or Haml tags by calling `Ipsummer.headline`. To customize the number of words in the headline, pass the `min_words` and/or `max_words` argument. To add a period at the end of the headline, pass `period: true`.

    <h2><%= Ipsummer.headline %></h2>

    %h2= Ipsummer.headline min_words: 3, max_words: 4

    <li><%= Ipsummer.headline period: true %></li>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
