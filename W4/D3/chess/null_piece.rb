require "singleton" 

class NullPiece 
    include Singleton

    def initialize
    end

    def symbol 
        return "_"
    end
end