class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i(edit update)
  layout 'chat', only: :index

  def index
    @groups = current_user.groups.newly
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.create(group_params)
      unless group.save
        redirect_to new_group_path, alert: 'グループ名を入力してください'
      else
        redirect_to group_messages_path(group), notice: 'チャットグループが作成されました'
      end
  end

  def edit
  end

  def update
    @group.update(group_params)
      unless @group.save
        redirect_to edit_group_path(@group), alert: 'グループ名を入力してください'
      else
        redirect_to group_messages_path(@group), notice: 'チャットグループが更新されました'
      end
  end

  private

  def group_params
    params.require(:group).permit(:title, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
