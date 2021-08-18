class AddColumnJobId < ActiveRecord::Migration[6.1]
  def change
    add_reference :job_applications,:job_post, index: true
    add_foreign_key :job_applications,:job_posts
  end
end
