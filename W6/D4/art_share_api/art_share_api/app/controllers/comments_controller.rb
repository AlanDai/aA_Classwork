class CommentsController < ApplicationController
    def index
        # if params.has_key?(:user_id)
        #     #any user that has had this artwork shared to them || artwork belonging to user (done)
        #     artworks = {}
        #     authored = Artwork.find_by(artist_id: params[:user_id])
        #     # debugger
        #     artworks[:authored] = authored
        #     shared = Artwork.select('artworks.*').joins(:shared_viewers).where(users: { id: params[:user_id]})
        #     artworks[:shared] = shared
        # elsif params.has_key?(:artwork_id)
        #     #any user that has had this artwork shared to them || artwork belonging to user (done)
        #     artworks = {}
        #     authored = Artwork.find_by(artist_id: params[:user_id])
        #     # debugger
        #     artworks[:authored] = authored
        #     shared = Artwork.select('artworks.*').joins(:shared_viewers).where(users: { id: params[:user_id]})
        #     artworks[:shared] = shared
        # else
        #     artworks = Artwork.all
        # end
        # render json: artworks
    end

    def create
        comment = Comment.new(comment_params)
        
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])

        if comment.destroy
            render json: comment
        else
            render json: 'Can\'t destroy this comment'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id)
    end

end