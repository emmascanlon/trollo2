class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all_items(@list.id)
  end

  def show
  end

  def new
    @item = List.items.new
  end

  def create
   Item.create_item(item_params, list.id)
   redirect_to list_items_path(@list)
end

  def edit

  end

  def update
    Item.update_item(@item.id, item_params)
    redirect_to list_items_path(@list)
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
  @item = Item.find(params[:id])
end

def item_params
  params.require(:item).permit(:title, :details, :priority, :list_id)
end
end
