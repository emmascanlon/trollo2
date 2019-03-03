class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = List.all_lists(@board.id)
  end

  def show
  end

  def new
    @list = @board.lists.new
  end
  
  def create
    List.create_list(list_params, @board.id)
    redirect_to board_lists_path(@board)
  end


  def edit
  end

  def update
   List.update_list(@list.id, list_params)
   redirect_to board_lists_path(@board)
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :icon, :priority)
  end
end
