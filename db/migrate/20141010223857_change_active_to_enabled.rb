class ChangeActiveToEnabled < ActiveRecord::Migration
  def change
    rename_column :repos, :active, :enabled
  end
end
