class CreateKittens < ActiveRecord::Migration[7.2]
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :age
      t.string :cuteness
      t.string :softness

      t.timestamps
    end
  end
end
