class TranslatesController < ApplicationController
  before_action :set_translate, only: %i[ show edit update destroy ]

  # GET /translates or /translates.json
  def index
    @translates = Translate.all
  end

  # GET /translates/1 or /translates/1.json
  def show
  end

  # GET /translates/new
  def new
    @translate = Translate.new
  end

  # GET /translates/1/edit
  def edit
  end

  # POST /translates or /translates.json
  def create
    @translate = Translate.new(translate_params)

    respond_to do |format|
      if @translate.save
        format.html { redirect_to @translate, notice: "Translate was successfully created." }
        format.json { render :show, status: :created, location: @translate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @translate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translates/1 or /translates/1.json
  def update
    respond_to do |format|
      if @translate.update(translate_params)
        format.html { redirect_to @translate, notice: "Translate was successfully updated." }
        format.json { render :show, status: :ok, location: @translate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @translate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translates/1 or /translates/1.json
  def destroy
    @translate.destroy
    respond_to do |format|
      format.html { redirect_to translates_url, notice: "Translate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translate
      @translate = Translate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def translate_params
      params.require(:translate).permit(:gta_id, :gta_original, :status, :xml_name, :xml_palce, :user_id_id, :type)
    end
end
