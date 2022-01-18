# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_user!
      

      before_action :set_service, only: %i[index create]
      before_action :set_comment, only: %i[show update destroy]
      MAX_PAGINATION_LIMIT = 100

      # GET api/v1/services
      def index
        @comments = @service.comments.limit(limit).offset(params[:offset])

        render json: @comments
      end

      def show
        render json: @comment
      end

      def create
        # @comment = Comment.new(comment_params)
        byebug
        @comment = @service.comments.create(comment_params.merge({ user_id: resource.id }))

        if @comment.save
          render json: @comment, status: :created, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @comment.destroy
      end

      private

      def limit
        [
          params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
          MAX_PAGINATION_LIMIT
        ].min
      end

      def set_service
        @service = Service.find(params[:service_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:title)
      end
    end
  end
end
