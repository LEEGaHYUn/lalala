class PostsController < ApplicationController
    before_filter :authenticate_user!
    def new
        # 사용자가 데이터를 입력할 화면
        #자동으로 액션 이릅과 같은 화면을 불러서 보여줘라 
    end
    
    def create
        # 입력받은 데이터를 실제 DB에 저장할 액션
        # 새로운 화면이 필요없음, 저장만 하면됨 
        
        @post = Post.new
        @post.userName = params[:userId]
        @post.content = params[:content]
        @post.title = params[:title]
        
        
        file = params[:pic]
        uploader = AvatarUploader.new
        uploader.store!(file)
        
        @post.image_url =uploader.url
        @post.save
        redirect_to '/posts/show'
    end
    
    def show
        @posts = Post.all.reverse
    end
    
    def destroy
        # authorize_action_for @post
        @post = Post.find(params[:post_id])
        @post.destroy
        redirect_to '/'
    end
    
    def detail
        @one_post = Post.find(params[:post_id])
        @comments = Comment.where(:post_id => params[:post_id])
        @likes = Like.first
    end 
    
    def edit
        # authorize_action_for @post
        @post = Post.find(params[:post_id])
    end
      
    def update
        # authorize_action_for @post
        @post = Post.find(params[:post_id])
        @post.title = params[:title]
        @post.content = params[:content]
        @post.save
        redirect_to '/posts/show'
    end
end
