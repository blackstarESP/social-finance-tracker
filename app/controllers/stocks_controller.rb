class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_stock_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = 'Could not locate that ticker symbol. Please try again.'
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = 'Please enter a ticker symbol to look up.'
      redirect_to my_portfolio_path
    end
  end

end
