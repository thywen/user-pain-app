class AddMaxScoreToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :max_score, :integer
  end
end
