class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.json do
        render json: { names: users.name }
      end
  end
end
