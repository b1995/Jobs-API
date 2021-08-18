module ExceptionHandler
    extend ActiveSupport::Concern
  
    included do

      rescue_from CanCan::AccessDenied, with: :four_zero_four
      
      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ message: e.message }, :not_found)
      end
  
      rescue_from ActiveRecord::RecordInvalid do |e|
        json_response({ message: e.message }, :unprocessable_entity)
      end

      def four_zero_four(e)
          json_response({message: e.message}, :not_found )
      end
    end
  end