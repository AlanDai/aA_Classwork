class Api::PokemonController < ApplicationController
    
    def index
        @pokemon = Pokemon.all
        render :index
    end

    def create

    end

    def show
        @pokemon = Pokemon.find_by(id: params[:id])
        render :show
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :image_url)
    end

end