class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @message = Message.new
  end
end
