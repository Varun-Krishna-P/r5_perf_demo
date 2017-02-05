class PostsController < ApplicationController
  def index
      @posts = Post.all      
      @posts = @posts.paginate(page: params[:page], per_page: 10)
  end

    
 def new
     @post = Post.new
 end

 def create
     @post = Post.new post_params
     if @post.save
         flash[:notice] = "Post created successfully"
         redirect_to @post
     else
         flash[:error] = "Can't create a post"
         render :new
     end
 end
 def edit
     @post = Post.find params[:id]
 end
    
 private
 def post_params
     params.require(:post).permit(:name, :text, :category, :user)
 end
end
