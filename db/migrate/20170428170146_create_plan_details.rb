class CreatePlanDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_details do |t|

      t.string :name, null: false
      t.time :start_time , null: false
      t.time :end_time , null: false
      t.string :place , null: false
      t.text :content
      t.integer :price , null: false
      t.integer :validity , limit: 1 , null: false , default: 1

      t.references  :plan, forein_key: true

      t.timestamps
    end
  end
end
