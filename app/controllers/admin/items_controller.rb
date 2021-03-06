class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!

  def new
    @customer = Customer
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
      flash[:success] = "商品を登録しました"
    else
      render :new
    end
  end

  def show
    @customer = Customer
    @item = Item.find(params[:id])
  end

  def index
    @customer = Customer
    @items = Item.order(id: :desc).page(params[:page]).reverse_order
  end

  def edit
    @customer = Customer
    @item = Item.find(params[:id])
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