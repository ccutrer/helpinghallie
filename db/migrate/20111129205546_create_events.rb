class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :subject
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
