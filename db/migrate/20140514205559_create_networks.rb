class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.timestamps
    end

    add_reference :jobs, :network, index: true
  end
end
