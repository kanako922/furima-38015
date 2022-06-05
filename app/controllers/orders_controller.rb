class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_params).permit(:zip_code, :prefecture_id, :city, :address_line, :building, :tel).merge(user_id: current_user.id)
  end

end
