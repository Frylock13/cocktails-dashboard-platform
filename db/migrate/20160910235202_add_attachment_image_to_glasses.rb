class AddAttachmentImageToGlasses < ActiveRecord::Migration
  def self.up
    change_table :glasses do |t|
      t.attachment :image

    end
  end

  def self.down
    remove_attachment :glasses, :image
  end
end
