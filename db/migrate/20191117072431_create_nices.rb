class CreateNices < ActiveRecord::Migration[5.2]
  def change
    create_table :nices do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
