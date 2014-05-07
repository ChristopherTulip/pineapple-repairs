class CreateFirstTables < ActiveRecord::Migration
  def change

    create_table :devices do |t|
      t.string        :name
      t.timestamps
    end

    create_table :models do |t|
      t.string        :name
      t.belongs_to    :device
      t.timestamps
    end

    create_table :problems do |t|
      t.string        :name
      t.timestamps
    end

    create_table :jobs do |t|
      t.string        :name
      t.string        :email
      t.integer       :phone_number

      t.belongs_to    :device
      t.belongs_to    :model
      t.belongs_to    :problem
      t.timestamps
    end

  end
end
