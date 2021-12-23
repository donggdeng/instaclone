class FriendRequestsController < ApplicationController
    def index

    end

    def create
        @friend_request = current_user.to_friendships.build to_user_id: friendship_params['format'],
                                                            status: :requested

        @friend_request.save

        redirect_to friends_path
        
    end

    private

    def friendship_params
        params.permit(:format)
    end
    
end
