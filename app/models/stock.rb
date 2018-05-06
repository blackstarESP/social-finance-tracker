# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  ticker     :string
#  name       :string
#  last_price :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Defines database relationships, rescue handling and lookup helper methods
#  for stocks table
class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_stock_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name,
          ticker: looked_up_stock.symbol,
          last_price: looked_up_stock.latest_price)
    rescue StandardError => e
      return nil
    end
  end
end
