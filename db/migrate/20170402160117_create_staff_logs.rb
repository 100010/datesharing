class CreateStaffLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_logs do |t|
      t.string :ip , null: false
      t.string :username , null: false
      t.string :action , null: false

      t.references  :staff, forein_key: true
      t.timestamps
    end
  end
end
