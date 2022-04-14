# frozen_string_literal: true

class BindingUsersController < ApplicationController
  def followings
    user = User.find(params[:id])
    @followings = user.followings.order(:id).page(params[:page])
  end

  def followers
    user = User.find(params[:id])
    @followers = user.followers.order(:id).page(params[:page])
  end

  def create
    rel = BindingUser.new
    rel.followed_id = params[:id]
    rel.follower_id = current_user.id
    rel.save

    redirect_to users_url, notice: t('follow_completed')
  end

  def destroy
    rel = BindingUser.find_by(followed_id: params[:id], follower_id: current_user.id)
    rel&.destroy

    redirect_to users_url, notice: t('unfollow_completed')
  end
end
