class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :ticket_number
      t.string :bug_title
      t.float :score
      t.integer :prority
      t.integer :type
      t.integer :likelyhood
      t.references :user

      t.timestamps null: false
    end
  end
end
