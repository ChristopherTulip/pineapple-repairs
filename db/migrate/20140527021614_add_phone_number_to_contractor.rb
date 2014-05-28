class AddPhoneNumberToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :phone_number, :string
  end
end
