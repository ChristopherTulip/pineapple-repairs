class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.change :phone_number, :string
    end
  end
end
