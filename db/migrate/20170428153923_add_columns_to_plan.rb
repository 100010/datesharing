class AddColumnsToPlan < ActiveRecord::Migration[5.0]
  def change

    add_column :plans, :place , :string , null: false, :after => :content
    add_column :plans, :main_image , :string , :after => :title
    add_column :plans, :start_date , :datetime , null: false, :after => :month
    add_column :plans, :end_date , :datetime , null: false, :after => :start_time
    add_column :plans ,:start_favorability_rating,:integer,null: false
    add_column :plans ,:end_favorability_rating,:integer,null: false
    add_column :plans ,:status,:integer,null: false
    add_column :plans,:validity,:integer , limit: 1 , null: false , default: 1


    rename_column :plans, :content, :description

    remove_column :plans, :BLOB, :text
    remove_column :plans, :satisfaction, :integer
    remove_column :plans, :closeness,	:integer
  end
end
