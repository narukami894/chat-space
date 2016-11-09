class GroupsController < ApplicationController
  before_action :authenticate_user!
  layout 'chat', only: :index
  def index
    @group = Group.new
  end
end
