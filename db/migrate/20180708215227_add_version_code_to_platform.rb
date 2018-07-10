class AddVersionCodeToPlatform < ActiveRecord::Migration[5.2]
  def change
    add_column :platforms, :version_code, :integer
  end
end
