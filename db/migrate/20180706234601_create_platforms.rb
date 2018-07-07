class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :package_id
      t.string :version
      t.belongs_to :app, index: true

      t.timestamps
    end
  end
end
