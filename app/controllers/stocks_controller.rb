class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You entered an empty search string. Please try again.'
    else
      @stock = Stock.new_stock_lookup(params[:stock])
      flash.now[:danger] = 'Could not locate that ticker symbol. Please try again.' unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
