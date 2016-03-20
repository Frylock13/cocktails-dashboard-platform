class AddAttachmentAvatarToChefs < ActiveRecord::Migration
  def self.up
    change_table :chefs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :chefs, :avatar
  end
end
