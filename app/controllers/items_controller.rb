class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @list.items
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @item.destroy
    redirect_to list_items_path(@list)
  end
  
  private
def set_list
  @list = List.find(params[:list_id])
end

def set_item
  @item = List.find(params[:id])
end

end
