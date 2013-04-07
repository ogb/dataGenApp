class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :directory
      t.integer :user_id
      t.timestamps
    end
  end
end
