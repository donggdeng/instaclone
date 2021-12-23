class FriendsController < ApplicationController
    def index
        @users = User.all.select{|user| user != current_user}
    end

end
