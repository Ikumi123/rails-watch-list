class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new
    @reviews = @list.reviews.order(created_at: :desc)
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @available_movies = Movie.where.not(id: @list.movies.pluck(:id))
    @movies = @list.movies
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
    params.require(:list).permit(:name, :photo)
  end
end
