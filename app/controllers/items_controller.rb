class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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

  private

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
