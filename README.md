## Lorem Ipsum Baked Into Your Views

Gem that serves up lorem ipsum text directly in markup or templates, with customizable features like length, links, bold, etc.

DSL I'm thinking about:

    Ipsum.paragraphs(3).length(200).with(:links).and(:bold)
    Ipsum.paragraph.min_length(200).with(:italic)
    Ipsum.p(5).with(:links).and(:italic).max_length(500).min_length(100)
    Ipsum.sentences(10).max_length(80).with(:links)
    Ipsum.words(3).max_length(11)
    Or even better:

    Ipsum.3.paragraphs.length(200).with(:links).and(:bold)
