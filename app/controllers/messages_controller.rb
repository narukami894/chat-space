class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'chat'
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @group_id = params[:group_id]

  end
end
