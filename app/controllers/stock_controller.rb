class StockController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      render 'welcome/index'
    else
      flash[:alert] = "Adj meg valami érvényest"
    end
    render action: "new"
  end
end
