class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|

      t.string :name , null: false
      t.string :email , null: false
      t.string :password_digest, null: false
      t.integer :status, null: false
      t.integer :validity,null: false , limit: 1,default: 1

      t.timestamps
    end
  end
end
