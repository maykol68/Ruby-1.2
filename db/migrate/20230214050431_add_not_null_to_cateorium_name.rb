class AddNotNullToCateoriumName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :categoria, :name, false
  end
end
