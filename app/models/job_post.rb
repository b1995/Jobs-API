class JobPost < ApplicationRecord
    validates_presence_of :title, :description
    has_many :job_applications
end
