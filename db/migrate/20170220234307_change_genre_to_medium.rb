class ChangeGenreToMedium < ActiveRecord::Migration
  def change
  	rename_column :pieces, :genre, :medium
  end
end
