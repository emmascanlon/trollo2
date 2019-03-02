class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @list.items
  end

  def show
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to list_items_path(@list)
    else 
      render :new
  end
end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to list_items_path(@list)
    else
      render :edit
  end
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
