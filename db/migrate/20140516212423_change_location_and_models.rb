class ChangeLocationAndModels < ActiveRecord::Migration
  def change
    remove_column :locations, :name

    add_column :locations, :city, :string
    add_column :locations, :country, :string

    add_column :models, :price, :integer
    add_column :models, :time, :integer
  end
end
