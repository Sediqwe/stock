class ImagesController < ApplicationController
before_action :authorized?
  def proba
  end  

  def index
    case params[:done]
      when "0"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: false).order(done: :desc, updated_at: :desc)
      when "1"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: true).order(updated_at: :desc)
      when "2"
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: true).order(id: :desc)
      else
        @images = Image.paginate(page: params[:page], per_page: 10).where(done: true).order(updated_at: :desc)
    end
    @images_info_true = Image.where(done: true).size
    @images_info_false = Image.where(done: false).size
    @images_info_all = Image.all.size
   end

  def new
    @image = Image.new
  end
  def newmulti
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
   
    if multifeltoltes?
        if params[:image][:photos].any?
        @image = Image.new(image_params)
        @image.user_id = current_user.id
        @image.multi = true
        @image.title = ""
        @image.description = ""
        if @image.save
          redirect_to images_path(:done => "0"), notice: "Felvétel sikeres"
        else
          render :newmulti
        end
      end

    else
      @image = Image.new(image_params)
      @image.user_id = current_user.id
      if @image.save
        redirect_to image_path(@image), notice: "Felvétel sikeres"  
      else
        render :new 
      end
    end
  end

  def update
    
    @image = Image.find(params[:id])
    
    if @image.update(image_params)
      if current_user.admin?
        @image.user_id  = current_user.id
        @image.save
      else
      end

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
    #redirect_to @image
    redirect_to images_path(:done =>0), notice: "Felvétel sikeres"  
    
  end

  def edit
    @image = Image.find(params[:id])
    
  end




  private
    def image_params
      params.require(:image).permit(:title, :description, :image, :done, :photos => [])
    end
    def image_params_multi
      
    end

    def comment_params
      
    end
    def je_params
      params.require(:product).permit(:id, :done)
    end

    def multifeltoltes?
      params[:commit] == "Multi felvétel"
    end
    def feltoltes?
      params[:commit] == "Felvétel"
    end
 

end
