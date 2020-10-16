require 'Deck'


describe Deck do
    subject (:test_deck) { Deck.new }

    describe "#initialize" do
        it 'returns an object with a 52 card array instance variable' do
            expect(test_deck.cards.length).to eq(52)
        end
        it 'has an array instance variable with only Card instances' do
            expect(test_deck.cards.all? {|card| card.is_a?(Card)}).to be_truthy
        end
        it 'has an array instance variable with unique values' do
            expect(test_deck.cards.uniq == test_deck.cards).to be_truthy
        end
    
    end

    describe "#shuffle" do
        let (:second_deck) { Deck.new }
        let (:original_cards) {second_deck.cards.dup}
        it 'returns a newly ordered array of cards' do
            second_deck.shuffle
            expect(second_deck.cards).not_to eq(original_cards)
        end
    end

    describe "#deal" do
        let (:original_num_cards) {test_deck.cards.length}
        it 'returns the correct number of unique cards' do
            expect(test_deck.deal(2).uniq.length).to eq(2)
        end

        it 'removes the inputted number of cards from @cards intance variable' do
            test_deck.deal(2)
            expect(test_deck.cards.length).to eq(original_num_cards-2)
        end
    end
    
#52 card deck
#instance variables: current cards (instances of Card class) in deck



#  # deck generate
#  # deck shuffle
#  # deck deal (.pop)

# returns correct number of unique cards
# takes cards from @cards

end