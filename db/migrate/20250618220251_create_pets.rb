class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.integer :user_id

      t.timestamps
    end
  end
end
