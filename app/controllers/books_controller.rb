class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    # ここで  current_userを定義しておく→showアクションの@userがまわりまわってcurrent_userになる
    # →部分テンプレート化した_infoファイルでcurrent_userを定義しなくてよくなる
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    # アソシエーションは右辺で2モデルを繋ぐ、左辺右辺で1モデルずつは×
    @user = @book.user

    @book_comment = BookComment.new
  end

  def index
    @book = Book.new
    # @book = Book(params[:id])
    @books = Book.all
    @users = User.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :star)
  end

end
