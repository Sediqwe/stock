class TranslaterController < ApplicationController
  def index
    @translater = Translate.where("original ~ ?", '^(((?!_)|[a-z].*).)*$').limit(200)
    @translate_all = Translate.all.size
    @translate_real_all =  Translate.where("original ~ ?", '^(((?!_)|[a-z].*).)*$').size
    
  end
  def toroldlegyszi
    Translate.delete_all
    redirect_to translater_path
  end
  
  def translate
    #translate_data = Translate.find(je_params[:id])
    trans = Translate.new
    trans.original = "ORIGINAL"
    trans.translate = "DE"
    puts "itt jártam genya"
    if trans.save
      render json: { valami: trans.errors.full_messages }
      
    else
      
      render json: { valami: trans.errors.full_messages }
      
    end
    
  end

private

  def je_params
    params.require(:product).permit(:id, :data)
  end

end
