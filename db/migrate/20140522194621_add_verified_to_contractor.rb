class AddVerifiedToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :verified, :boolean, default: false
  end
end
