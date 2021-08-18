class JobApplicationsController < ApplicationController
    before_action :set_job_applications, only: [:show, :update, :destroy]

    def index
        @job_applications = JobApplication.all
        json_response(@job_applications)
      end
    
      # POST /job_applications
      def create
        @job_application = JobApplication.create!(job_application_params)
        json_response(@job_application, :created)
      end
    
      # GET /job_applications/:id
      def show
        json_response(@job_application)
        @job_application.set_as_seen
      end
    
      # PUT /job_applications/:id
      def update
        @job_application.update(job_application_params)
        head :no_content
      end
    
      # DELETE /job_applications/:id
      def destroy
        @job_application.destroy
        head :no_content
      end
    
      private
    
      def job_application_params
        # whitelist params
        params.require(:job_application).permit(:user_id, :job_id, :cover_letter, :is_seen)
      end
    
      def set_job_application
        @job_application = JobApplication.find(params[:id])
      end

      def set_as_seen
          self.update_attribute(:seen, true)
      end

end