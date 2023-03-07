class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.datetime :createdAt
      t.datetime :updatedAt
    end
  end
end


