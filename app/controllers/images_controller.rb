class ImagesController < ApplicationController
#before_action :authorized?
  def index

    case params[:done]
      when "0"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: false).order(done: :desc, id: :desc)
      when "1"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: true).order(id: :desc)
      else
        @images = Image.paginate(page: params[:page], per_page: 10).order(done: :desc, id: :desc)
    end
    @images_info_true = Image.where(done: true).size
    @images_info_false = Image.where(done: false).size
   end

  def new
    @image = Image.new
  end
  
  def done
    @image = Image.find(params[:id])
    @image.done = params[:done]
    @image.save
    respond_to do |format|
      format.js
    end
  end


  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to imagesnew_path, notice: "Felvétel sikeres"
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
      params.require(:image).permit(:title, :description, :image, :done)
    end

    def comment_params
      
    end
end
