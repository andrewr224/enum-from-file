class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :breed
      t.string :eye_color
      t.string :sex

      t.timestamps
    end
  end
end
