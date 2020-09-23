class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :date_of_birth
      t.string :type
      t.boolean :adopted, :default => false

      t.timestamps
    end
  end
end
