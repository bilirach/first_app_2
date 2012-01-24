class AddImageToEtudiants < ActiveRecord::Migration
  def change
    add_column :etudiants, :image, :string
  end
end
