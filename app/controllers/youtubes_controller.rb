class YoutubesController < ApplicationController
  before_action :set_youtube, only: [:show, :edit, :update, :destroy]

  # GET /youtubes
  # GET /youtubes.json
  def index
    case params[:done]
      when "0"
        @youtubes = Youtube.paginate(page: params[:page], per_page: 10).where(done: false).order(done: :desc, updated_at: :desc)
      when "1"
        @youtubes = Youtube.paginate(page: params[:page], per_page: 10).where(done: true).order( updated_at: :desc)
      else
        @youtubes = Youtube.paginate(page: params[:page], per_page: 10).order(done: :desc, updated_at: :desc)
    end
  @youtubes_info_true = Youtube.where(done: true).size
  @youtubes_info_false = Youtube.where(done: false).size
  @youtubes_info_all = Youtube.all.size
    end

  # GET /youtubes/1
  # GET /youtubes/1.json
  def show
  end
  def done
    @youtube = Youtube.find(params[:id])
    @youtube.done = params[:done]
    @youtube.save
    respond_to do |format|
      format.js
    end
    
  end
  
  # GET /youtubes/new
  def new
    @youtube = Youtube.new
  end

  # GET /youtubes/1/edit
  def edit
  end

  # POST /youtubes
  # POST /youtubes.json
  def create
    @youtube = Youtube.new(youtube_params)

    respond_to do |format|
      if @youtube.save
        format.html { redirect_to @youtube, notice: 'Youtube was successfully created.' }
        format.json { render :show, status: :created, location: @youtube }
      else
        format.html { render :new }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtubes/1
  # PATCH/PUT /youtubes/1.json
  def update
    respond_to do |format|
      if @youtube.update(youtube_params)
        format.html { redirect_to @youtube, notice: 'Youtube was successfully updated.' }
        format.json { render :show, status: :ok, location: @youtube }
      else
        format.html { render :edit }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtubes/1
  # DELETE /youtubes/1.json
  def destroy
   @youtube.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to youtubes_url, notice: 'Youtube was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube
      @youtube = Youtube.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def youtube_params
      params.require(:youtube).permit(:link, :title, :desc, :done)
    end
end
