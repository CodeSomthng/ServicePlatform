require 'rails_helper'

describe 'Comments API', type: :request do
  # let!(:book) { create(:book) }
  # let!(:book) { create(:book) }


  describe 'GET /api/v1/services/:service_id/comments' do
    # before do
    #   author = FactoryBot.create(:author, first_name: "George", last_name: "Orwell", age: 99)
    #   FactoryBot.create(:book, title: '1984', author_id: author.id)
    # end
    let!(:user) { create(:user) }
    let!(:service) { create(:service, title: "Diving") }
    let!(:comment) { create(:comment, title: 'cool!', service_id: service.id, user_id: user.id) }

    it 'returns all comments' do
      get api_v1_service_comments_path(service.id)

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      byebug
      expect(response_body[:title]).to eq('cool!')
    end
  end
end 