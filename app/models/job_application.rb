class JobApplication < ApplicationRecord
    belongs_to :user

    validates_presence_of :cover_letter
end
