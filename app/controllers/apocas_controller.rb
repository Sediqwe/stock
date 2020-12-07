class ApocasController < ApplicationController
  def index
    @apoca = Apoca.all
    @apoca_group = Apoca.select(:darab).group(:darab)
    @apoca_count = Apoca.select(:darab).group(:darab).count
  end

  def show
  end
end
