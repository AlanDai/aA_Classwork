class Card
    FACE_CARD = {11=>'J', 12=>'Q', 13=>'K', 14=>'A'}

    attr_reader :value, :suit

    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def symbol
        if (2..10).to_a.include?(@value)
            @value.to_s
        else
            FACE_CARD[@value]
        end

    end

end