require 'rails_helper'

describe User do
  describe '#create' do
    it "名前, メールアドレス, パスワード, 確認用パスワードがあれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "名前がないと登録できない" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください。")
    end

    it "メールアドレスがないと登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "パスワードがないと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end

    it "パスワードがあっても確認用パスワードがないと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end

    it "すでに登録されているメールアドレスでは登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します。")
    end

    it "パスワードが7文字以下では登録できない" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password][0]).to include("は8文字以上で入力してください。")
    end
  end
end
