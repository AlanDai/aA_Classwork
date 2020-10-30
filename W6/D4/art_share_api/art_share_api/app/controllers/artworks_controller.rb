class ArtworksController < ApplicationController
    def index
        if params.has_key?(:user_id)
            #any user that has had this artwork shared to them || artwork belonging to user (done)
            artworks = {}
            authored = Artwork.find_by(artist_id: params[:user_id])
            # debugger
            artworks[:authored] = authored
            shared = Artwork.select('artworks.*').joins(:shared_viewers).where(users: { id: params[:user_id]})
            artworks[:shared] = shared
        else
            artworks = Artwork.all
        end
        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])

        if artwork
            render json: artwork
        else
            render json: 'There\'s nothing there', status: 404
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])

        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
       
    def destroy
        artwork = Artwork.find_by(id: params[:id])

        if artwork.destroy
            render json: artwork
        else
            render json: 'Can\'t destroy this artwork'
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end