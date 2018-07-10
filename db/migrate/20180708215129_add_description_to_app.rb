class AddDescriptionToApp < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :short_description, :string
    add_column :apps, :long_description, :text
  end
end
