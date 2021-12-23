class FriendRequest < ApplicationRecord
    belongs_to :from_user, class_name: "User"
    belongs_to :to_user, class_name: "User"
    
    validates :from_user, presence: true
    validates :to_user, presence: true

    validate :check_users_difference

    def check_users_difference
        errors.add(:from_user, "Can't request self as friend") if from_user == to_user
    end
  end
  