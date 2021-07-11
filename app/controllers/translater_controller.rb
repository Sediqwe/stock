class TranslaterController < ApplicationController
  before_action :authorized?
  def index
    @translater = Translate.paginate(page: params[:page], per_page: 10).where("original ~ ?", '^(((?!_)(?!^\d+$)|[a-z]?![0-9].*).)*$').where(trans_type: :false).where("length(original) > 1")
    @translate_all = Translate.all.size
    @translate_real_all =  Translate.where("original ~ ?", '^(((?!_)(?!^\d+$)|[a-z]?![0-9].*).)*$').size
    
  end
  def toroldlegyszi
    Translate.delete_all
    redirect_to translater_path
  end
  
 

  def translate
    
    translate_data = Translate.find_by(trans_id: je_params[:id])
    trans = Translate.find_or_create_by(trans_id: translate_data.trans_id, users_id: current_user.id)
    trans.file_id = translate_data.file_id
    trans.trans_id = translate_data.trans_id.strip
    trans.original = translate_data.original.strip
    trans.upload_id = translate_data.upload_id
    trans.file = translate_data.file.strip
    trans.trans_type = true
    trans.translate = je_params[:data]
    trans.users_id = current_user.id
    trans.status = 0
    
    if trans.save
       render json: { valami: "OK" }
      else
      render json: { valami: "NOK" }
      end
    
  end

private

  def je_params
    params.require(:product).permit(:id, :data)
  end

end
