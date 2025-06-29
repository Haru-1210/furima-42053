class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_invalid_purchase

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_invalid_purchase
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def order_address_params
    params.require(:order_address).permit(
      :postal_code, :prefecture_id, :city, :house_number,
      :building_name, :phone_number, :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
