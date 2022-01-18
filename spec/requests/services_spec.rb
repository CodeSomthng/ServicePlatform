require 'rails_helper'

describe 'Comments API', type: :request do
  # let!(:book) { create(:book) }
  # let!(:book) { create(:book) }


  describe 'GET /api_v1_services' do
    # before do
    #   author = FactoryBot.create(:author, first_name: "George", last_name: "Orwell", age: 99)
    #   FactoryBot.create(:book, title: '1984', author_id: author.id)
    # end
    # let!(:service) { FactoryBot.create(:service, title: "Diving") }
    let!(:service) { create(:service, title: "Diving") }

    it 'returns all comments' do
      get api_v1_services_path

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(
        [
          {
            "id": "#{service.id}".to_i,
            "title": 'Diving'
          }
        ]
      )
    end

    it 'returns a subset of books based on pagination' do

      get api_v1_services_path, params: { limit: 1 }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(
        [
          {
            "id": "#{service.id}".to_i,
            "title": 'Diving'
          }
        ]
      )
    end

    it 'returns a subset of books based on limit and offset' do
      get api_v1_services_path, params: { limit: 1, offset: 0 }

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq(
        [
          {
            "id": "#{service.id}".to_i,
            "title": 'Diving'
          }
        ]
      )
    end
  end

  describe 'POST /api/v1/services' do
    it 'create a new service' do
      expect {
        post api_v1_services_path, params: {
          service: {title: 'Helicopter ride'}
        }
      }.to change { Service.count }.from(0).to(1)

      expect(response).to have_http_status(:created)  
      expect(Service.count).to eq(1)
      expect(response_body[:title]).to eq('Helicopter ride')
    end
  end

  describe 'DELETE api/v1/service/:id' do

    let!(:service) { create(:service)}

    it 'deletes a book' do
      expect {
        delete "/api/v1/services/#{service.id}"
    }.to change { Service.count }.from(1).to(0)


      expect(response).to have_http_status(:no_content)
    end
  end


end 