class ChangeBugColumnName < ActiveRecord::Migration
  def change
    rename_column :bugs, :type, :bug_type
    rename_column :bugs, :prority, :priority
  end
end
