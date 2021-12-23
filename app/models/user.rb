# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :photos, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  has_many :to_friend_requests, foreign_key: "from_user_id", class_name: "FriendRequest"
  has_many :from_friend_requests, foreign_key: "to_user_id", class_name: "FriendRequest" 

  has_many :requested_friends, through: :to_friend_requests, source: :to_user
  has_many :potential_friends, through: :from_friend_requests, source: :from_user

end
