class TranslaterController < ApplicationController
  def index
    @translater = Translate.all.last(200)
  end
end
