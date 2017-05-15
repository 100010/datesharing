class CreatePlans < ActiveRecord::Migration[5.0]
  def change
      create_table :plans do |t|

      ## Database authenticatable
      t.string :title,              null: false, default: ""
      t.string :thubnail, 			null: false, default: ""
      t.text :content, 				null: false, default: ""
      t.text :BLOB,	 				null: false
	    t.integer :closeness,			null: false
	    t.integer :satisfaction,		null: false
      t.references  :planner, forein_key: true
      t.references  :buy_history, forein_key: true

      t.timestamps
    end
  end
end
