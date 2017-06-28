class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new
        @comment.content = params[:comment_content]
        @comment.post_id = params[:post_id]
        @comment.save
        
        redirect_to "/posts/detail/#{params[:post_id]}"
    end
    
    def destroy
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
        
        redirect_to "/posts/detail/#{params[:post_id]}"
    end
    
    def edit
        @comment = Comment.find(params[:comment_id])
    end
    
    def update
        @comment = Comment.find(params[:comment_id])
        @comment.content = params[:comment_content]
        @comment.post_id = params[:post_id]
        @comment.save
        
        redirect_to :back
    end
end
