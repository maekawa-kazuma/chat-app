require 'rails_helper'

RSpec.describe 'メッセージ投稿機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  context '投稿に失敗したとき' do
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする

      # 値をテキストフォームに入力する
      # 送信した値がDBに保存されていることを確認する
      # expect  do
      #   find('input[name="commit"]').click
      # end.to change { Message.count }.by(1)
      # 投稿一覧画面に遷移していることを確認する
    end
    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする

      # 添付する画像を定義する
      # image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付す
      # 送信した値がDBに保存されていることを確認する
      # 投稿一覧画面に遷移していることを確認する
    end
    it 'テキストと画像の投稿に成功すること' do
      # サインインする

      # 添付する画像を定義する
      # 値をテキストフォームに入力する
      # 送信した値がDBに保存されていることを確認する
      # expect  do
      #   find('input[name="commit"]').click
      # end.to change { Message.count }.by(1)
      # 送信した値がブラウザに表示されていることを確認する
    end
  end
end
