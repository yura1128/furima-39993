class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase = Purchase.new
    if @item.purchase_record.present? || @item.user == current_user
      redirect_to root_path
    end


    
  end

  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.valid?
      pay_item
      # バリデーションが通れば保存
      @purchase.save
      redirect_to root_path
      # 成功した場合の処理（リダイレクトなど）を記述
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      # バリデーションに引っかかった場合、エラーメッセージと共に購入ページに戻る
      render :index, status: :unprocessable_entity
    end
  end


  private
  def purchase_params
    params.require(:purchase).permit(:postal_code, :shipping_area_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end