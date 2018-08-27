class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :job
      t.string :email
      t.integer :company_id
    end
  end
end
