class BloggersController < ApplicationController
  before_action :find_blogger, only: :show

  def show; end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      flash[:success] = 'Blogger successfully created'
      redirect_to @blogger
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
