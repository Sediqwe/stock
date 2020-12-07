class ApocasController < ApplicationController
  def index
    @apoca = Apoca.all
    @apoca_group = Apoca.select(:darab).group(:darab)
    @apoca_count = Apoca.select(:darab).group(:darab).count
  end

  def show
  end

  def new
    @apoca = Apoca.new
  end

  def create   
    @apoca = Apoca.new(apoca_params)
    if @apoca.save
      render 'new'
    else
      render 'new'
    end
    
  end
  private
  def apoca_params
    params.require(:apoca).permit(:user, :darab)
  end
end
