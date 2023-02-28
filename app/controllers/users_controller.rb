class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

    @relationships = Relationship.new
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end


  # フォローしたときの処理
  def follow(user_id)
    # 引数で外部キーとOOを紐づける？
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    # (＝followedカラムが含まれているか？？)
    followings.include?(user)
  end



  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
