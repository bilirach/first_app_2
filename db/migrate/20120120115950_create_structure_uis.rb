class CreateStructureUis < ActiveRecord::Migration
  def change
    create_table :structure_uis do |t|
      t.string :page
      t.integer :total
      t.string :records
      t.string :rows

      t.timestamps
    end
  end
end
