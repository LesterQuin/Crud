class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(params.required(:market).permit(:name, :address, :prodcut, :price))
    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def show
    @market = Market.find(params[:id])
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    if @market.update(params.required(:market).permit(:name, :address, :product, :price))
      redirect_to markets_path
    else
      render :new
  end
  end

  def destroy
    @market = Market.find(params[:id])
    if @market.delete
      redirect_to markets_path
    end
  end
end
