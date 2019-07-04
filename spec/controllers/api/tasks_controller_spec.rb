require 'rails_helper'

describe Api::TasksController, type: :controller do
  describe 'TaskAPI' do
    it '全てのtaskを取得する' do
      FactoryBot.create_list(:task, 10)
  
      get :index
      json = JSON.parse(response.body)
  
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
  
      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(10)
    end
  end

  describe 'TaskAPI' do
    it '特定のtaskを取得する' do
      task = create(:task, title: 'test-title', text: 'test-text')
  
      get :show, params: {id: task.id}
      json = JSON.parse(response.body)
  
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
  
      # 要求した特定のtaskのみ取得した事を確認する
      expect(json['data']['title']).to eq(task.title)
    end
  end

  describe 'TaskAPI' do
    it '新しいtaskを作成する' do
       valid_params = { title: 'title', text: 'text' }
   
       #データが作成されている事を確認
       expect { post :create, params: { task: valid_params } }.to change(Task, :count).by(+1)
   
       # リクエスト成功を表す200が返ってきたか確認する。
       expect(response.status).to eq(200)
     end
  end

  describe 'TaskAPI' do
    it 'taskの編集を行う' do
      task = create(:task, title: 'old-title', text: 'old-text')
  
      put :update, params: { id: task.id, task: {title: 'new-title', text: 'new-text'}  }
      json = JSON.parse(response.body)
  
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
  
      #データが更新されている事を確認
      expect(json['data']['title']).to eq('new-title')
    end
  end

  describe 'TaskAPI' do
    it 'taskを削除する' do
      task = create(:task)
  
      #データが削除されている事を確認
      expect { delete :destroy, params: { id: task.id } }.to change(Task, :count).by(-1)
  
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end
  end
end
