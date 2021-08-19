class ChangeExpiredColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :job_posts, :expired, :date
    rename_column :job_posts, :expired, :expiry_date

    
  end
end
