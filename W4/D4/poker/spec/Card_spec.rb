require 'Card'

describe Card do
    describe '#initialize' do
        subject (:test_card) {Card.new(4,:clubs)}
        context 'when card is successfully initialized' do
            it 'sets the cards number value' do
                expect(test_card.value).to eq(4)
            end
            it 'sets the cards suit value' do
                expect(test_card.suit).to eq(:clubs)
            end
        end
    end
end