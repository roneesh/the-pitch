class AddMaxPitchCountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :maxpitchcount, :integer, :default => 1000
  end
end
