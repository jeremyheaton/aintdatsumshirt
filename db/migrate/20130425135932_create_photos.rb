class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.integer :bytes
       t.references :user
      t.timestamps
    end
  end
end
