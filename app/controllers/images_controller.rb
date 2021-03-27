class ImagesController < ApplicationController
before_action :authorized?
  def proba
  end  

  def index
    #image.image.blob.content_type
    

    case params[:done]
      when "0"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: false).order(done: :desc, updated_at: :desc)
      when "1"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: true).order(updated_at: :desc)
      else
        @images = Image.paginate(page: params[:page], per_page: 10).order(done: :desc, updated_at: :desc)
    end
    @images_info_true = Image.where(done: true).size
    @images_info_false = Image.where(done: false).size
    @images_info_all = Image.all.size
   end

  def new
    @image = Image.new
  end
  
  
  def donetwo
    p je_params[:id]
    image = Image.find(je_params[:id])
    image.done = je_params[:done]
    if image.save
      render json: { valami: 'OK' }
    else
      render json: { valami: 'NOK' }
    end

    
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
      redirect_to image_path(@image), notice: "Felvétel sikeres"
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
    def je_params
      params.require(:product).permit(:id, :done)
    end
end
