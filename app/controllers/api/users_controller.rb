# frozen_string_literal: true

module Api
  class UsersController < BaseController
    def new
      @user = User.new
    end

    def create
      @user = User.new(users_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages.join(',') },
               status: :unprocessable_entity
      end
    end

    def show
      render json: @user, status: :ok
    end

    def update
      if @user.update(first_name: users_params[:first_name])
        render json: @user, status: :ok
      else
        render json: { errors: @user.errors.full_messages.join(',') },
               status: :unprocessable_entity
      end
    end

    private

    def users_params
      params.require(:user).permit(
        :first_name, :last_name, :email, :password, :signup_date
      )
    end
  end
end
