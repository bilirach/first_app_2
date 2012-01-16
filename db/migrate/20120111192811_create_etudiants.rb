class CreateEtudiants < ActiveRecord::Migration
  def change
    create_table :etudiants do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :description

      t.timestamps
    end
  end
end
