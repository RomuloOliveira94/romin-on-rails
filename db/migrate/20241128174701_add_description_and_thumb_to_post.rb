class AddDescriptionAndThumbToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :description, :text
    add_column :posts, :thumb, :string
  end
end
