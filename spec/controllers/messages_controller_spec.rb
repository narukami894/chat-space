require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  before do
    login_user

    @user = User.first
    allow(controller)
    .to receive(:current_user)
    .and_return(@user)
  end

  describe 'GET #index' do
    it '@groupsが降順に並ぶ' do
      groups = create_list(:group, 3)
      get :index, group_id: groups.first.id
      expect(assigns(:groups)).to match(groups.sort{|a, b| b.created_at <=> a.created_at })
    end

    it '@groupが正常な値になる' do
      group = create(:group)
      get :index, group_id: group.id
      expect(assigns(:group)).to eq group
    end

    it '@messagesが昇順に並ぶ' do
      group = create(:group)
      messages = create_list(:message, 3, group_id: group.id)
      get :index, group_id: group.id
      expect(assigns(:messages)).to match(messages.sort)
    end

    it 'messages#indexのテンプレートが読み込まれる' do
      group = create(:group)
      get :index, group_id: group.id
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it 'データベースに新しい情報が保存される' do
      group = create(:group)
      expect {
        post :create, group_id: group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

   it 'messages#indexにリダイレクトする' do
      group = create(:group)
      post :create, group_id: group.id, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path
    end

    it '本文が空だとデータベースに保存されない' do
      group = create(:group)
      expect {
        post :create, group_id: group.id, message: attributes_for(:message, body: nil)
      }.not_to change(Message, :count)
    end
  end
end
