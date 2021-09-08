class TranslaterController < ApplicationController
  before_action :authorized?
  def index
    #@translater = Translate.paginate(page: params[:page], per_page: 10).where("original ~ ?", '^(((?!_)(?!^\d+$)|[a-z]?![0-9].*).)*$').where(trans_type: :false, status: "0" ).order(:id)
    @translater = Translate.where(trans_type: false).paginate(page: params[:page], per_page: 30).order(row_num: :ASC, col_num: :ASC)
    @translate_all = Translate.all.size
    @translate_real_all =  Translate.where("original ~ ?", '^(((?!_)(?!^\d+$)|[a-z]?![0-9].*).)*$').size
    
  end
  def toroldlegyszi
    Translate.delete_all
    redirect_to translater_path
  end
  
  def ok 
    trans = Translate.find(je_params[:id])
     #át kell állítani mindent előbb pirosra hogy aztán csak ez legyen a zöld
    trans_all = Translate.where(trans_id: trans.trans_id, trans_type: true, status: 2)
    trans_all.each do |d|
      d.status = 4
      d.save      
    end
    #átállítom azt a fordítást hogy az el van fogadva!
    trans_original = Translate.find(je_params[:id])
    trans_original.status = 2
    trans_original.save
    trans.status = 2 
    if trans.save
     render json: { valami: "OK" }
     else
     render json: { valami: "NOK" }
     end

  end
  def nok 
    trans = Translate.find(je_params[:id])
    if(trans.trans_type == false)
        trans2 = Translate.where(trans_id: trans.trans_id, trans_type: true)
        trans2.each do |d|
          d.status = 4
          d.save
        end
    else
    end
    trans.status = 4
    if trans.save
      render json: { valami: "OK" }
     else
     render json: { valami: "NOK" }
     end
  end


  def translate
    
    translate_data = Translate.find(je_params[:id])
    trans = Translate.find_or_create_by(trans_id: translate_data.trans_id, users_id: current_user.id)
    trans.file_id = translate_data.file_id
    trans.trans_id = je_params[:id]
    trans.original = translate_data.original.strip
    trans.upload_id = translate_data.upload_id
    trans.file = translate_data.file.strip
    trans.row_num = translate_data.row_num
    trans.col_num = translate_data.col_num
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
