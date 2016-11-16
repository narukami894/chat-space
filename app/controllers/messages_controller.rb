class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'chat'
  def index
    @users = User.all
    @groups = current_user.groups.newly
    @group = Group.find(params[:group_id])
    @group_id = params[:group_id]
    @messages = Message.where(group_id: params[:group_id])
    @message = Message.new
  end

  def create
    group = Group.find(params[:group_id])
    Message.create(message_params)
    redirect_to group_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
