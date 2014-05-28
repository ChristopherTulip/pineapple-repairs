class AddLocationIdToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :location_id, :integer
  end
end
