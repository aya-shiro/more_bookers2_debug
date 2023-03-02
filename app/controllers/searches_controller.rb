class SearchesController < ApplicationController
  def search
    # form_withで受け取ったモデル(＝選んだモデル)を@rangeに格納
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
