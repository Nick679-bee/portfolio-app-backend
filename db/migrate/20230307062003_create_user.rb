class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true, name: 'uk_email' }
      t.string :password_hash, null: false
      t.datetime :createdAt
      t.string :prof_pic_url
      t.integer :phone_number
      t.string :zip_address
      t.string :country
      t.string :profession
      t.string :education
      t.integer :experience
      t.string :skills
    end
  end
end