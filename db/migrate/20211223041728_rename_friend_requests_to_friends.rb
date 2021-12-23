class RenameFriendRequestsToFriends < ActiveRecord::Migration[6.1]
  def change
    rename_table :friend_requests, :friendships
  end
end
