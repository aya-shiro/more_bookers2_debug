class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # form_withで受け取ったモデル情報(User/Book)を格納
    @model = params[:model]
    @content = params[:content]
    @word = params[:word]

    if @model == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
