class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i(edit update)
  layout 'chat', only: :index

  def index
    @groups = Group.order('id desc')
  end

  def new
    @group = Group.new
    @user = User.all
  end

  def create
    group = Group.create(group_params)
    redirect_to group_messages_path(group.id), notice: 'チャットグループが作成されました'
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to group_messages_path(@group.id), notice: 'チャットグループが更新されました'
  end

  private

  def group_params
    params.require(:group).permit(:title, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
