class TranslaterController < ApplicationController
  def index
    @translater = Translate.all.last(200)
    @translate_all = Translate.all.size
    @translate_real_all = Translate.where("length(original) > 0").size
    
  end
  def toroldlegyszi
    Translate.delete_all
    redirect_to translater_path
  end
end
