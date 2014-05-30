class RemoveAttachmentsFromModels < ActiveRecord::Migration
  def change
    remove_attachment :networks, :avatar
    remove_attachment :devices, :avatar
    remove_attachment :models, :avatar
    remove_attachment :problems, :avatar
  end
end
