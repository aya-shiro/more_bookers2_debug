class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    book = Book.find(params[:book_id])
    # 外部キーbook_idに紐づいたbookテーブルの1レコードbook.idをもとにインスタンス生成し、いいねを作る
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save

    # redirect_backでこのアクションを使ったときの画面に戻る！
    # 引数で指定しているroot_pathはredirect_backできなかったときの緊急避難先、root_pathが無難
    # 課題6非同期通信のため削除
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    book = Book.find(params[:book_id])
    # createで作ったインスタンスをfind_byで取得してdestroyする
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy

    # いいねを押す前にいた画面をリダイレクト先に
    # 課題6非同期通信のため削除
    # redirect_back(fallback_location: root_path)

  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
end
