class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :github_url
      t.string :live_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
