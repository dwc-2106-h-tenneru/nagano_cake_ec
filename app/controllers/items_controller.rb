class ItemsController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @items = Item.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :is_active, :price, :image_id, :genre_id)
  end



end