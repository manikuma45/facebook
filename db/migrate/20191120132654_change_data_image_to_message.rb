class ChangeDataImageToMessage < ActiveRecord::Migration[5.2]
  def change
  	change_column :messages, :image, 'text USING CAST(image AS text)'
  end
end
