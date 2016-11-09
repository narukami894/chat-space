class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'chat'
  def index
    @message = Message.new
  end
end
