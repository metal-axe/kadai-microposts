class FavoritesController < ApplicationController
  before_action :require_user_logged_in


  
  def create
    favorite = Micropost.find(params[:favorite_id])
    current_user.favorite(favorite)
    flash[:success] = 'コメントをお気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Micropost.find(params[:favorite_id])
    current_user.unfavorite(favorite)
    flash[:success] = 'コメントのお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end