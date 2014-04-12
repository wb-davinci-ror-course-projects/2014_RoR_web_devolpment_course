class EmailVerify < ActiveRecord::Migration
  def change
    add_column :users, :was_email_verfied, :boolean
    add_column :users, :email_verification_token, :string
  end
end
