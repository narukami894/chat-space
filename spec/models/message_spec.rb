require 'rails_helper'

describe Message do
  describe '#create' do

    it "本文があれば投稿できる" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "本文がないと投稿できない" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include "を入力してください。"
    end
  end
end
