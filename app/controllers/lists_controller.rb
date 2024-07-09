class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @List = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path(@lists)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path(@bookmark.list), status: :see_other
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end