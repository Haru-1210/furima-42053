class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @Item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: '商品を削除しました。'
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :image, :item_name, :description, :category_id, :condition_id,
      :shipping_charge_id, :prefecture_id, :shipping_day_id, :price
    )
  end
end
