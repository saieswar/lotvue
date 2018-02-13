class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :avatar
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
