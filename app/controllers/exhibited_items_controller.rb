class ExhibitedItemsController < ApplicationController
  before_action :set_exhibitedItem, only: [:edit, :show, :destroy]
  before_action :authenticate_user!, only: [:new]
  def index
    @exhibitedItems = ExhibitedItem.all
    @dealings = Dealing.all
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

  def destroy
    if @exhibitedItem.destroy
      redirect_to root_path
    else
      redirect_to root_path, alert: '削除が失敗しました'
    end
  end

  def edit
  end

  def update
    @exhibitedItem = ExhibitedItem.find(params[:id])
    @exhibitedItem.update(exhibitedItem_params)
    if @exhibitedItem.save
      redirect_to exhibited_item_path(@exhibitedItem.id)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def exhibitedItem_params
    params.require(:exhibited_item).permit(:name, :explanation, :price, :category_id, :status_id, :payment_id, :prefecture_id, :until_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_exhibitedItem
    @exhibitedItem = ExhibitedItem.find(params[:id])
  end
end
