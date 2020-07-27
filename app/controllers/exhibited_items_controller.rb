class ExhibitedItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
  def index
  end

  def new
  
  end
  
  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
