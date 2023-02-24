class FavoritesController < ApplicationController
  def create
    # user = User.find(params[:id])
    @book = Book.find(params[:book_id])
    # favorite = current_user.favorites.new(user_id: user.id)
    favorite = current_user.favorites.new(user_id: current_user.id)

    favorite.save
    # いいねを押す前にいた画面をリダイレクト先に指定
    redirect_to book_path(@book.id)
  end

  def destroy
    # user = User.find(params[:id])
    @book = Book.find(params[:book_id])
    # favorite = current_user.favorites.new(user_id: user.id)
    favorite = current_user.favorites.new(user_id: current_user.id)

    favorite.save
    # いいねを押す前にいた画面をリダイレクト先に指定
    redirect_to book_path(@book.id)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
end
