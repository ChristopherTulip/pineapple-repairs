class AddNameToContractor < ActiveRecord::Migration
  def change

  	add_column :contractors, :name, :string
  end
end
