class CommentsController < ApplicationController
    before_action :set_user
    def create
        @comment =Comment.new(comment_params)
        # byebug
        @comment.user= current_user
        @comment.save
        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.require(:comment).permit(:content , :product_id  )
    end

end
