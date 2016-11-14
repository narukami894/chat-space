class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i(edit update)
  layout 'chat', only: :index

  def index
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to group_messages_path(group.id)
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to group_messages_path(@group.id)
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
