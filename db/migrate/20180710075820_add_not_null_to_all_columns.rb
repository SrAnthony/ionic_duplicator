class AddNotNullToAllColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :apps, :name, false
    change_column_null :apps, :color_primary, false
    change_column_null :apps, :color_secondary, false
    change_column_null :platforms, :name, false
    change_column_null :platforms, :package_id, false
    change_column_null :platforms, :version, false
    change_column_null :platforms, :app_id, false
    change_column_null :platforms, :version_code, false
  end
end
