class AddRecruiterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :recruiter, :boolean, default: false
  end
end
