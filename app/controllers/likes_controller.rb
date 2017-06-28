class LikesController < ApplicationController
     def like_create
        like = Post.find(params[:post_id]).likes.create(likeCount: params[:likeCount])
        like.save
        redirect_to :back
    end
end
