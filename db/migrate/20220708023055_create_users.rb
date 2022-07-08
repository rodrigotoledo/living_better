class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :document, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.date :birthday_at, null: false
      t.string :phone, null: false
      t.string :status, default: :active, null: false

      t.timestamps
    end
  end
end
