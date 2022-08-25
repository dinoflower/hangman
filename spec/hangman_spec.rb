# frozen_string_literal: true

require "hangman"

RSpec.describe Hangman do
  it "has a version number" do
    expect(Hangman::VERSION).not_to be nil
  end
end
