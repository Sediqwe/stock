class UploadsController < ApplicationController
  before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /uploads or /uploads.json
  def index
    @uploads = Upload.all
    
  end

  # GET /uploads/1 or /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end
  def proccc
    de = Upload.find(params[:id])
    de.uploads.each do |ezafile|
      filepath = ActiveStorage::Blob.service.send(:path_for, ezafile.key)
      valami = ezafile.blob.filename
      data = File.read(filepath)
      translation_content = []
      enum_content = data.each_line
      enum_content.each do |content_line|
        key, value = content_line.split('=')
        next if key == "\r\n"
        translation_content << {file_id:ezafile.id, trans_id: key, original: value, translate: valami.to_s , upload_id: params[:id]}
      end
      Translate.insert_all(translation_content)
    end
    redirect_to translater_path
  end


  def pro_alt
    if upload_params[:file].content_type == 'application/zip'
      Zip::File.open(upload_params[:file].tempfile) do |zip_file|
        zip_file.each do |entry|
          @translation_file = TranslationFile.new(upload_id: @upload.id, file_name: entry.name, file_type: 'text/plain')
          @translation_file.save
          translation_content = []

          file_content = entry.get_input_stream.read
          enum_content = file_content.each_line
          enum_content.each do |content_line|
            key, value = content_line.split('=')
            next if key == "\r\n"
            translation_content << {translation_file_id: @translation_file.id, key: key, value: value}
          end
          @translation_file_content = TranslationFileContent.insert_all(translation_content)
        end
      end
    end
  end

  # POST /uploads or /uploads.json
  def create
    puts params.inspect
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: "Upload was successfully created." }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1 or /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: "Upload was successfully updated." }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1 or /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: "Upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_params
      params.require(:upload).permit(:name, :description, :version, :project_id, :user_id, uploads: [] )
    end
end
