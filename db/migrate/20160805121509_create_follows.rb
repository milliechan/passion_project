class CreateFollows < ActiveRecord::Migration
  def change
  	create_table :follows do |t|
  		t.references :user 
  		t.integer :celebrity_id

  		t.timestamps null: false
  	end 
  end
end
