class DeviseCreateLibrarians < ActiveRecord::Migration
  def change
    create_table(:librarians) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :librarians, :email,                :unique => true
    add_index :librarians, :reset_password_token, :unique => true
    # add_index :librarians, :confirmation_token,   :unique => true
    # add_index :librarians, :unlock_token,         :unique => true
    # add_index :librarians, :authentication_token, :unique => true
  end

end
