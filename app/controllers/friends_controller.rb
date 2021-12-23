class FriendsController < ApplicationController
    def index
        @potential_friends = current_user.potential_friends
        @requested_friends = current_user.requested_friends
        @strangers = User.all.select do |user| 
            !@potential_friends.include?(user) && !@requested_friends.include?(user) && (user != current_user)
        end
    end

end
