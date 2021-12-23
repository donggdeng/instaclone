class RenameFriendsToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    rename_table :friends, :friend_requests
  end
end
