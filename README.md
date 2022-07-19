# Hangman

A simple game of Hangman created in Ruby and featuring the ability to save and load files. Figure out the mystery word by guessing letters. Don't make six wrong guesses!

Requires Ruby and is playable in the command line.

## Installation

The gem is self-contained, i.e. playable without the need to add it to another gemfile.

Install it with:

    $ gem "hangman", git: "https://github.com/dinoflower/hangman"

## Usage

Simply run:

    $ ruby hangman/lib/hangman.rb

Additional navigation may be necessary depending on the save location of the repository. No additional commands required - the game will load on start.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dinoflower/hangman.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
