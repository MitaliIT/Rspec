require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  let(:current_user) { FactoryBot.create(:user) }
  @blog = FactoryBot.create(:blog)

  before do
    sign_in current_user # Use the sign_in method provided by Devise test helpers
  end

  describe '#create' do
    let(:params_data) {
      {
        "blog": {
          "blog_name": "test user",
          "blog_score": 123,
          "content": "user",
          "user_id": current_user.id
        }
      }
    }
    let(:params_update_data) {
      {
        "blog": {
          "blog_name": "hello user",
          "blog_score": 578,
          "content": "user updated",
          "user_id": current_user.id
        }
      }
    }

    it 'creates a blog' do
      post "#{blogs_path}",params: params_data
      expect(response.status).to eq 302
    end

    it 'index method' do
      get "#{blogs_path}"
      expect(response.status).to eq 200
    end

    it 'update method' do
      post "#{blogs_path}",params: params_update_data
      expect(response.status).to eq 302
    end

     it 'show method' do
      get "#{blog_path(id: 1)}"
      expect(response.status).to eq 200
    end

    it 'new method' do
      get "#{new_blog_path}"
      expect(response.status).to eq 200
    end

    it 'delete method' do
      delete "#{blog_path(id:1)}"
      expect(response.status).to eq 302
    end
  end
end
