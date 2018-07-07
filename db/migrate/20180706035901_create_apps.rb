class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.string  :name
      t.string  :color_primary
      t.string  :color_secondary

      t.timestamps
    end
  end
end
