class DropPhavuResources < ActiveRecord::Migration
  def self.up
    drop_table :phavu_resources
  end

  def self.down
    create_table :phavu_resources do |t|
      t.text :resources
      t.integer :phavu_content_id
    end
  end
end
