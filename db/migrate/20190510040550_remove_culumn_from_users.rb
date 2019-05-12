class RemoveCulumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :company, :string
    remove_column :users, :department, :string
    remove_column :users, :position, :string
    remove_column :users, :employee_num, :integer
    remove_column :users, :company_post_code, :integer
    remove_column :users, :company_location, :string
    remove_column :users, :establishment_year, :integer
    remove_column :users, :industry_type, :string
    remove_column :users, :ceo_name, :string
    remove_column :users, :references, :integer
  end
end
