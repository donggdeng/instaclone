class FriendshipsController < ApplicationController
    def index
        @friends = current_user.friends
        @potential_friendships = current_user.potential_friendships.includes(:from_user)
        @requested_friendships = current_user.requested_friendships.includes(:to_user)
        @strangers = User.all.select do |user| 
            (user != current_user) && !current_user.related_friends.include?(user)
        end
    end

    def create
        @friendship = current_user.to_friendships.build to_user_id: friendship_params['to_user'],
                                                            status: :requested

        @friendship.save

        redirect_to friendships_path
    end

    def update
        @friendship = Friendship.find friendship_params['id']
        @friendship.update status: friendship_params['status']

        redirect_to friendships_path
    end

    private

    def friendship_params
        params.permit(:id, :to_user, :status)
    end
    
end
