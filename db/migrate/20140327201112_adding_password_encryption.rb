class AddingPasswordEncryption < ActiveRecord::Migration
  def change
   rename_column :user, :password, :password_hash
  
  end
end
