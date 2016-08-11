class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :url 
      t.boolean :completed
      t.references :user
    end
  end
end
