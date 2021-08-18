require 'rails_helper'


RSpec.describe "JobApplications", type: :request do

let(:user) { create(:user) }
let!(:job_post) { create(:job_post) }
let!(:job_applications) { create_list(:job_application, 20, job_post_id: job_post.id, user_id: user.id) }
let(:user_id) { user.id }
let(:job_post_id) { job_post.id }
let(:job_application_id) { job_applications.first.id }
let(:headers) { user.create_new_auth_token }


  describe "GET /index" do
    before { get '/job_applications', params: {}, headers: headers}
    it 'returns job_applications' do
      puts json
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test for GET /job_applications/:id
  describe 'GET /job_applications/:id' do
    before { get "/job_applications/#{job_application_id}", params: {}, headers: headers}

    context 'when the record exists' do
      it 'returns the job_application' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(job_application_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:job_application_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find JobApplication with 'id'=#{job_application_id}\"}")
      end
    end
  end

  describe 'POST /job_applications' do
    let(:valid_attributes) { { cover_letter: 'Full stack Dev'} }
    let(:invalid_attributes) { { } }

    context 'when the request is valid' do
      before { post "/job_posts/#{job_post_id}/job_applications", params: valid_attributes, headers: headers  }

      it 'creates a job_application' do
        expect(json['cover_letter']).to eq('Full stack Dev')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      
      before { post "/job_posts/#{job_post_id}/job_applications", params: invalid_attributes , headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Cover letter can't be blank\"}")
      end
    end
  end


end