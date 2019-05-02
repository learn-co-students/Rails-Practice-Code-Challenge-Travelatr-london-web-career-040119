class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]

  def index
    @posts = Post.order(creation_time: :desc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    extra_params = {
      creation_time: DateTime.now,
      likes: 0
    }
    @post = Post.new(post_params.merge(extra_params))
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to @post
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted'
      redirect_to @posts_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to @posts_path
    end
  end

  def like
    @post.likes += 1
    @post.save
    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
  end
end
