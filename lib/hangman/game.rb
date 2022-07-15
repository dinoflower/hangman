require 'pry-byebug'

module Hangman
  class Game
    include SerializableSave
    attr_accessor :lives, :message, :incorrect_guesses, :guesses_string, :display_hash

    def self.pick_word
      dictionary = File.read('google-10000-english-no-swears.txt').split
      dictionary.select! { |word| word.length > 4 }
      dictionary.sample
    end

    def initialize(word)
      @word = word.upcase
      @lives = 6
      @incorrect_guesses = []
      @display_hash = {}
    end

    def generate_display
      puts 'Guess the secret word! Six incorrect guesses, and you lose.'
      @word.chars.each_index do |index|
        @display_hash[index] = '_'
      end
    end

    def prompt_save
      puts 'Would you like to save your game? (y/n)'
      answer = gets.chr.upcase
      case answer
      when 'Y'
        save_game
      when 'N'
        return
      else
        puts 'Please answer "yes" or "no."'
        prompt_save
      end
    end

    def save_game
      json = serialize
      Dir.mkdir('data') unless Dir.exist?('data')
      puts 'Name your save file:'
      extension = gets.chomp
      save_file = File.new("/data/#{extension}.json")
      save_file.write(json)
    end

    def guess_letter
      puts "Incorrect guesses: #{@incorrect_guesses.join(', ')}" unless @incorrect_guesses.empty?
      puts [nil, "You have #{@lives} lives remaining. Guess a letter:"] unless @lives == 1
      puts [nil, "You only have one life left! Guess a letter:"] if @lives == 1
      letter = gets.chr.upcase
      guess_letter unless letter.match?(/[a-zA-Z]/)

      check_guess(letter)
    end

    def check_guess(letter)
      if @incorrect_guesses.include?(letter) || @display_hash.value?(letter)
        puts [nil, 'You have already guessed that letter.']
        guess_letter
      elsif @word.include?(letter)
        update_good_guess(letter)
      else
        update_bad_guess(letter)
      end
    end

    def update_bad_guess(letter)
      puts [nil, "Oh no! #{letter} wasn't in the word."]
      @incorrect_guesses << letter
      @lives -= 1
    end

    def update_good_guess(letter)
      puts [nil, "Good guess! #{letter} is in the word."]
      @word.chars.each_with_index do |a, index|
        @display_hash[index] = letter if a == letter
      end
    end

    def play_game
      generate_display
      loop do
        prompt_save
        puts @display_hash.values.join(' ')
        guess_letter
        break if @lives == 0 || @display_hash.values.join == @word
      end
      end_message = @lives == 0 ? "The word was #{@word}. Better luck next time!" : 'Congratulations!'
      puts @display_hash.values.join, end_message
    end
  end
end

# prompt player (and ask if they would like to save)
