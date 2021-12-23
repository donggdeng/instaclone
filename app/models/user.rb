# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :photos, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  has_many :to_friendships, foreign_key: "from_user_id", class_name: "Friendship"
  has_many :from_friendships, foreign_key: "to_user_id", class_name: "Friendship" 

  has_many :requested_friends, -> { Friendship.requested }, through: :to_friendships, source: :to_user
  has_many :potential_friends, -> { Friendship.requested }, through: :from_friendships, source: :from_user

end
