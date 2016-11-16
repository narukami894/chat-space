class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'chat'
  def index
    @users = User.all
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @group_id = params[:group_id]
  end
end
