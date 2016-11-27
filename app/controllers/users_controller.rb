class UsersController < ApplicationController

  def index
    users = User.where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do |format|
      format.html
      format.json do
        render json: { name: users.name }
      end
    end
  end
end
