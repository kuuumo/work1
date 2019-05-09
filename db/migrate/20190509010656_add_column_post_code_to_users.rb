class AddColumnPostCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_post_code, :integer
  end
end
