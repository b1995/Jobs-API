class JobPostsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_job_post, only: [:show, :update, :destroy]

  # GET /job_posts
  def index
    @job_posts = JobPost.all
    json_response(@job_posts)
  end

  # POST /job_posts
  def create
    @job_post = JobPost.create!(job_post_params)
    json_response(@job_post, :created)
  end

  # GET /job_posts/:id
  def show
    json_response(@job_post)
  end

  # PUT /job_posts/:id
  def update
    @job_post.update(job_post_params)
    head :no_content
  end

  # DELETE /job_posts/:id
  def destroy
    @job_post.destroy
    head :no_content
  end

  private

  def job_post_params
    # whitelist params
    params.permit(:title, :description, :expired)
  end

  def set_job_post
    @job_post = JobPost.find(params[:id])
  end
end
