class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
    include DeviseTokenAuth::Concerns::SetUserByToken

    
  end