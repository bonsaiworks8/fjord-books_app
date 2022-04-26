# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @binding_user = BindingUser.find_by(followed_id: @user.id, follower_id: current_user.id)
  end
end
