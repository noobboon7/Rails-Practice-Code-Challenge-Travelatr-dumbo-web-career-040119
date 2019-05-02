class BloggersController < ApplicationController
  before_action :get_blogger, only: [:show, :edit, :update]
  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      redirect_to @blogger
    else
      render :new
    end
  end


  def update
    @blogger.update(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :edit
    end
  end

  private

  def get_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :age,:bio)
  end

end
