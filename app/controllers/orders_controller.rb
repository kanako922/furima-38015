class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_params, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if (current_user.id == @item.user_id) || (@item.order.present?)
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
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :address_line, :building, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

end
