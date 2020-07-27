class ExhibitedItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
  def index
    @exhibitedItems = ExhibitedItem.all
  end

  def new
    @exhibitedItem = ExhibitedItem.new
  end
  
  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end