class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :title
      t.string :token
      t.string :avatar, default: 'https://s3.amazonaws.com/project-management-bucket/missing_avatar.png'
    end
  end
end
