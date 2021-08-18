class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.boolean :seen, :default => false
      t.text :cover_letter
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
