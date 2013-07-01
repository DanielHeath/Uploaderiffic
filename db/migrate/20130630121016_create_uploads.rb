class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :intent
      t.string :filepath
      t.string :metadata
      t.timestamps
    end
  end
end
