class AddAvatarsToModels < ActiveRecord::Migration

  def self.up
    add_attachment :networks, :avatar
    add_attachment :devices, :avatar
    add_attachment :models, :avatar
    add_attachment :problems, :avatar
  end

  def self.down
    remove_attachment :networks, :avatar
    remove_attachment :devices, :avatar
    remove_attachment :models, :avatar
    remove_attachment :problems, :avatar
  end

end
