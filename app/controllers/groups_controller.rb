class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = Group.new
  end
end
