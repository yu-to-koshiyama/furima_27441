class ExhibitedItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
  def index
    @exhibitedItems = ExhibitedItem.all
  end

  def new
    @exhibitedItem = ExhibitedItem.new
  end

  def create
    @exhibitedItem = ExhibitedItem.new(exhibitedItem_params)
    if @exhibitedItem.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def exhibitedItem_params
    params.require(:exhibited_item).permit(:name, :explanation, :price, :category_id, :status_id, :payment_id, :prefecture_id, :until_delivery_id, :image).merge(user_id: current_user.id)
  end
end
