class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :activities, array: true, default: []
      t.integer :user_id

      t.timestamps
    end
  end
end
