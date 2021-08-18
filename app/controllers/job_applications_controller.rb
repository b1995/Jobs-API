class JobApplicationsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_job_application, only: [:show, :update, :destroy]

    def index
        @job_applications = JobApplication.all
        json_response(@job_applications)
      end
    
      # POST /job_posts/:id/job_applications
      def create
        @job_application = current_user.job_applications.create!(job_application_params)
        json_response(@job_application, :created)
      end
    
      # GET /job_applications/:id
      def show
        json_response(@job_application)
        @job_application.set_as_seen
      end
    
      # DELETE /job_applications/:id
      def destroy
        @job_application.destroy
        head :no_content
      end
    
      private
    
      def job_application_params
        # whitelist params
        params.permit(:cover_letter, :user_id, :job_post_id)
      end
    
      def set_job_application
        @job_application = JobApplication.find(params[:id])
      end

      def set_as_seen
          self.update_attribute(:seen, true)
      end

end