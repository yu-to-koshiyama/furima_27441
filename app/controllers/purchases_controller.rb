class PurchasesController < ApplicationController
  before_action :set_exhibitedItem, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:index]
  def index
    @purchase = PurchaseDealing.new
  end

  def new
    @purchase = PurchaseDealing.new
  end

  def create
    @purchase = PurchaseDealing.new(purchase_params)
    if @purchase.valid? && pay_item
    
      @purchase.save
      return redirect_to root_path
    else
      render "index"    # バリデーションに弾かれた時
    end
  end

  private
  def purchase_params
    params.require(:purchase_dealing).permit( :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token)
    .merge(user_id: current_user.id, exhibited_item_id: params[:exhibited_item_id])
  end

  def set_exhibitedItem
    @exhibitedItem = ExhibitedItem.find(params[:exhibited_item_id])
    @dealings = Dealing.all

    if user_signed_in? != true
      redirect_to new_user_session_path
    elsif current_user.id == @exhibitedItem.user_id || @exhibitedItem.dealing != nil
      redirect_to root_path
    end  
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @exhibitedItem.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end

