class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:follower_id])
    follow = User.new(relationship_params)
    follower_id = current_user.id
    # follows = current_user.relationships.new(relationship_params)
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user.id])
    followed = current_user.relationships.find_by(params[:id])
    followed.destroy
    redirect_back(fallback_location: root_path)
  end

  provate
  def relationship_params
    params.requier(:relationship).permit(:follower_id, :followed_id)
  end

end
