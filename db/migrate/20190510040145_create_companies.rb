class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company
      t.string :department
      t.string :position
      t.integer :employee_num
      t.integer :company_post_code
      t.string :company_location
      t.integer :establishment_year
      t.string :industry_type
      t.string :ceo_name

      t.timestamps
    end
  end
end
