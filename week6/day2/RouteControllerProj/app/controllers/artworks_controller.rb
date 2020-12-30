class ArtworksController < ApplicationController
    def index
        debugger
        if params.has_key?(:artist_id)
            artwork = Artwork.where(artist_id: params[:artist_id])
        else
            artwork = Artwork.all
        end
        render json: artwork
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
        #debugger
        render json: Artwork.find(params[:id])
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :img_url, :artist_id)
    end
end
