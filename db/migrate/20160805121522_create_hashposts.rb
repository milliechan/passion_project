class CreateHashposts < ActiveRecord::Migration
  def change
  	create_table :hashposts do |t|
  		t.integer :hash_id
  		t.integer :post_id

  		t.timestamps null: false 
	end
  end
end
