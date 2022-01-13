module Api
  module V1
    class UsersController < ApplicationController
      # load_and_authorize_resource
      # before_action :authenticate_user!

      # def cart
      #   @cart = Cart.all.limit(10)
      # end

      def profile
        @user = User.all
        # @user = current_user
      end

      def edit; end
    end
  end
end
