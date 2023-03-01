class RelationshipsController < ApplicationController

  # def create
  #   user = User.find(params[:follower_id])
  #   follow = User.new(relationship_params)
  #   follower_id = current_user.id
  #   # follows = current_user.relationships.new(relationship_params)
  #   follow.save
  #   redirect_back(fallback_location: root_path)
  # end

  # def destroy
  #   user = User.find(params[:user.id])
  #   followed = current_user.relationships.find_by(params[:id])
  #   followed.destroy
  #   redirect_back(fallback_location: root_path)
  # end


  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    # 下記はredirect_back(fallback_location: root_path)とほぼ同じ
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー一覧、user.rbで定義したテーブルを呼び出す
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end



  private
  def relationship_params
    params.requier(:relationship).permit(:follower_id, :followed_id)
  end

end
