class AddMapsToSpeciesContents < ActiveRecord::Migration
  def self.up
    add_column :arahy_contents, :maps, :text
    add_column :cajca_contents, :maps, :text
    add_column :chafs_contents, :maps, :text
    add_column :cicar_contents, :maps, :text
    add_column :glyma_contents, :maps, :text
    add_column :lencu_contents, :maps, :text
    add_column :lotja_contents, :maps, :text
    add_column :lupal_contents, :maps, :text
    add_column :lupan_contents, :maps, :text
    add_column :medsa_contents, :maps, :text
    add_column :medtr_contents, :maps, :text
    add_column :phacn_contents, :maps, :text
    add_column :phavu_contents, :maps, :text
    add_column :pea_contents, :maps, :text
    add_column :tripr_contents, :maps, :text
    add_column :vicfa_contents, :maps, :text
    add_column :vigra_contents, :maps, :text
    add_column :vigun_contents, :maps, :text
  end

  def self.down
    remove_column :arahy_contents, :maps
    remove_column :cajca_contents, :maps
    remove_column :chafs_contents, :maps
    remove_column :cicar_contents, :maps
    remove_column :glyma_contents, :maps
    remove_column :lencu_contents, :maps
    remove_column :lotja_contents, :maps
    remove_column :lupal_contents, :maps
    remove_column :lupan_contents, :maps
    remove_column :medsa_contents, :maps
    remove_column :medtr_contents, :maps
    remove_column :phacn_contents, :maps
    remove_column :phavu_contents, :maps
    remove_column :pea_contents, :maps
    remove_column :tripr_contents, :maps
    remove_column :vicfa_contents, :maps
    remove_column :vigra_contents, :maps
    remove_column :vigun_contents, :maps
  end
end
