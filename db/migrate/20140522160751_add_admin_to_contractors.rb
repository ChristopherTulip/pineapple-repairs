class AddAdminToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :admin, :boolean, default: false
  end
end
