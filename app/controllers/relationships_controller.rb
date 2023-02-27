class RelationshipsController < ApplicationController

  def create
    follow = User.new(relationship_params)
    follower_id = current_user.id
    # follows = current_user.relationships.new(relationship_params)
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = current_user.relationships.find_by(params[:id])
    follow.destroy
    redirect_back(fallback_location: root_path)
  end

  provate
  def relationship_params
    params.requier(:relationship).permit(:follower_id, :followed_id)
  end

end
