class AddAttachmentFlagToStyles < ActiveRecord::Migration
  def self.up
    change_table :styles do |t|
      t.attachment :flag
    end
  end

  def self.down
    remove_attachment :styles, :flag
  end
end
