class FriendRequestsController < ApplicationController
    def index

    end

    def create
        @friend_request = current_user.to_friend_requests.build to_user_id: friend_request_params['format']

        @friend_request.save

        redirect_to friends_path
        
    end

    private

    def friend_request_params
        params.permit(:format)
    end
    
end
