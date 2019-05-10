class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phonetic
      t.string :email
      t.integer :tel
      t.string :company
      t.string :department
      t.string :position
      t.integer :employee_num
      t.string :company_location
      t.integer :establishment_year
      t.string :industry_type
      t.string :ceo_name

      t.timestamps
    end
  end
end
