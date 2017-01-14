class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.float :latitude
      t.float :longitude
      t.string :css_class
      t.string :sign_body
      t.string :body
      t.datetime :happened_at

      t.timestamps
    end
  end
end
