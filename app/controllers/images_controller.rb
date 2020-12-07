class ImagesController < ApplicationController
  before_action :authorized?
  def index
    @images = Image.paginate(page: params[:page], per_page: 2)
   end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to @image
    else
      render :edit
    end
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new()
  
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to @image
    
  end

  def edit
    @image = Image.find(params[:id])
    
  end

  private
    def image_params
      params.require(:image).permit(:title, :description, :image)
    end

    def comment_params
      
    end
end
