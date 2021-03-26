class JeController < ApplicationController
  def read
    render json: { valami: 'return' }
  end
  private
  def je_params
    params.require(:product).permit(:name, :description)
  end
end
