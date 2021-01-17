class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: { errors: 'Bad Credentials' }, status: 400
    end
  end
end
