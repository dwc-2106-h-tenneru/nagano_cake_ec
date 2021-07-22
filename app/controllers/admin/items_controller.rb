class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @customer = Customer.find(1)
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
    @customer = Customer.find(1)
  end

  def index
    @items = Item.order(id: :desc).page(params[:page]).reverse_order
    @customer = Customer.find(1)
  end

  def edit
    @item = Item.find(params[:id])
    @customer = Customer.find(1)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :is_active, :price, :image_id, :genre_id)
  end

end