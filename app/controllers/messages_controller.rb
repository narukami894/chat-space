class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'chat'
  def index
    @user = User.all
    user = current_user
    @groups = user.groups.order('id desc')
    @group = Group.find(params[:group_id])
    @message = Message.new
    @group_id = params[:group_id]
  end
end
