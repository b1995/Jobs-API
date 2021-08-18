require 'rails_helper'


RSpec.describe "JobApplications", type: :request do

let(:user) { create(:user) }
let!(:job_post) { create(:job_post) }
let!(:job_applications) { create_list(:job_application, 20, job_post_id: job_post.id, user_id: user.id) }
let(:user_id) { user.id }
let(:job_post_id) { job_post.id }
let(:id) { job_applications.first.id }


  describe "GET /index" do
    before { get '/job_applications', params: {}}
    it 'returns job_applications' do
      puts json
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end