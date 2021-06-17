class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name, null: false, default: ""
      t.string :token, null: false, default: ""
      t.integer :age
      t.integer :mount, default: 10000
      t.timestamps
    end

    add_index :players, :token, unique: true

  end
end
