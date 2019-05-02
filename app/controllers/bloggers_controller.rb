class BloggersController < ApplicationController
  before_action :find_blogger, except: %i[index new create]

  def index
    @bloggers = Blogger.all
  end

  def show; end

  def new
    @blogger = Blogger.new
  end

  def edit; end

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

  def update
    if @blogger.update_attributes(blogger_params)
      flash[:success] = 'Blogger was successfully updated'
      redirect_to @blogger
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @blogger.destroy
      flash[:success] = 'Blogger was successfully deleted'
      redirect_to @bloggers_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to @bloggers_path
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
