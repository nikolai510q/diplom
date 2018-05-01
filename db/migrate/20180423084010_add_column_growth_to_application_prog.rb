class AddColumnGrowthToApplicationProg < ActiveRecord::Migration[5.1]
  def change
  	add_column :applications_training_programs, :growth, :integer
  end
end
