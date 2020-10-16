require_relative 'Card'
class Deck
    VALUES = (2..14).to_a
    SUITS = [:diamonds, :clubs, :hearts, :spades]

    attr_reader :cards

    def initialize
        @cards = []
        generate
        shuffle
    end

    def generate
        VALUES.each do |value|
            SUITS.each do |suit|
                @cards << Card.new(value, suit)
            end
        end
    end

    def shuffle
        @cards.shuffle!
    end

    def deal(num_cards)
        @cards.pop(num_cards)
    end
end