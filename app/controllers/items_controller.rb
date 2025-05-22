class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).all
  end
end
