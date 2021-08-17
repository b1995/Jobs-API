require 'rails_helper'


RSpec.describe "job_posts", type: :request do

  let!(:job_posts) { create_list(:job_post, 10) }
  let(:job_post_id) { job_posts.first.id }


   # Test for GET /job_posts/
  describe "GET /job_posts" do
    before { get '/job_posts' }

    it 'returns job_posts' do
      puts json
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

   # Test for GET /job_posts/:id
   describe 'GET /job_posts/:id' do
    before { get "/job_posts/#{job_post_id}" }

    context 'when the record exists' do
      it 'returns the job_post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(job_post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:job_post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find JobPost with 'id'=#{job_post_id}\"}")
      end
    end
  end

   # Test for POST /job_posts
   describe 'POST /job_posts' do

    let(:valid_attributes) { { title: 'Learn Elm', description: 'Full stack Dev', location: 'Amman', expires: '15/9/2021' } }

    context 'when the request is valid' do
      before { post '/job_posts', params: valid_attributes }

      it 'creates a job_post' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/job_posts', params: { title: 'Foobar' , location: 'Amman', expires: '5/9/2021' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Description can't be blank\"}")
      end
    end
  end

   # Test for PUT /job_posts/:id
   describe 'PUT /job_posts/:id' do
    let(:valid_attributes) { { title: 'Senior  Engineer' } }

    context 'when the record exists' do
      before { put "/job_posts/#{job_post_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test for DELETE /job_posts/:id
  describe 'DELETE /job_posts/:id' do
    before { delete "/job_posts/#{job_post_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end