class CreateMoviments < ActiveRecord::Migration[7.0]
  def change
    create_table :moviments do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :role
      t.decimal :value
      t.date :date
      # t.references :client_origin, null: false, foreign_key: truerail
      t.integer :client_origin_id

      t.timestamps
    end

    add_foreign_key :moviments, :clients, column: :client_origin_id
  end
end
