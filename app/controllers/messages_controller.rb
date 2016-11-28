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
    message = Message.new(message_params)
    respond_to do |format|
      if message.save
        format.html
        format.json do
          render json: {
                          body: message.body,
                          name: message.user.name,
                          time: message.display_time,
                          image: message.image
                }
        end
      else
        redirect_to group_messages_path, alert: 'メッセージが空では投稿できません'
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
