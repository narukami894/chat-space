class GroupsController < ApplicationController
  def index
    @group = Group.new
  end
end
