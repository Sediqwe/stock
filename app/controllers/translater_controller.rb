class TranslaterController < ApplicationController
  def index
    @translater = Translate.where("original ~ ?", '^(((?!_|[0-9])|[a-z].*).)*$')
    #@translater = Translate.where('original ~ :pat', :pat => "^(((?!_)|[a-z].*).)*$")
    
    
    @translate_all = Translate.all.size
    @translate_real_all =  Translate.where("original ~ ?", '^(((?!_|[0-9])|[a-z].*).)*$').size
    
  end
  def toroldlegyszi
    Translate.delete_all
    redirect_to translater_path
  end
end
