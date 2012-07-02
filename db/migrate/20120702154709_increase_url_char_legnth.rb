class IncreaseUrlCharLegnth < ActiveRecord::Migration
  def self.up
    change_column :meetings, :url, :string, :limit => 4096
    change_column :reference_datasets, :url, :string, :limit => 4096
    change_column :resources, :url, :string, :limit => 4096
  end

  def self.down
    change_column :meetings, :url, :string
    change_column :reference_datasets, :url, :string
    change_column :resources, :url, :string
  end
end
