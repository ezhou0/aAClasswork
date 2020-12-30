class ArtworkSharesController < ApplicationController
    def destroy #unshare
        share = ArtworkShare.find(params[:id])

        share.destroy
        render json: share
    end

    def create #share
        share = ArtworkShare.new(artwork_share_params)
        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
        def artwork_share_params
            params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
        end

end
