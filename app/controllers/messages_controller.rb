class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'chat'
  def index
    @groups = current_user.groups.newly
    @group = Group.find(params[:group_id])
    @messages = Message.where(group_id: params[:group_id])
    @message = Message.new
  end

  def create
    group = Group.find(params[:group_id])
    @message = Message.create(message_params)

    respond_to do |format|
      format.html
      format.json {
        render json: { name: @message.user.name,  body: @message.text, created_at: @message.created_at }
      }
      end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
