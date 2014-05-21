class AddFinishedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :finished, :boolean, default: false
  end
end
