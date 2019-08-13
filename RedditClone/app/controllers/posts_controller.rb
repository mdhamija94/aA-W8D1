class PostsController < ApplicationController
  
  def new
    @post = Post.new

    render :new
  end

  def create
    
    @post = Post.new(post_params)
    debugger
    @post.user_id = current_user.id

    if @post.save
      # params[:post][:sub_ids].each do |sub_id|
      #   Postsub.create!(post_id: @post.id, sub_id: sub_id)
      # end

      flash[:notice] = "Created #{ @post.title }"
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def show

  end

  def edit
    
  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end


end
