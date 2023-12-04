class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.image.attach(params[:item][:image])
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    unless current_user == @item.user
      redirect_to root_path
      return
    end

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :product_name,
      :product_description,
      :price,:category_id,
      :item_condition_id,
      :shipping_fee_id,
      :shipping_area_id,
      :estimated_shipping_date_id,
      :image
    ).merge(user_id: current_user.id)
  end

end
