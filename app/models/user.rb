# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :binding_users, foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :followings, through: :binding_users, source: :followed
  has_many :rev_binding_users, class_name: 'BindingUser', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed
  has_many :followers, through: :rev_binding_users, source: :follower
end
