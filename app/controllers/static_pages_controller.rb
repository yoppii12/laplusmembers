class StaticPagesController < ApplicationController
  def home
    @Title = "Stock Datas"
    @datas = Stock.all
  end
end
