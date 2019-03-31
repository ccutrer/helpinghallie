class CreateEvents < ActiveRecord::Migration[4.2]
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
