class CreatePlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :planners do |t|

    	t.references	:user, forein_key: true

    	t.string	:gender
    	t.string	:occupation
    	t.integer	:age


      	t.timestamps
    end
  end
end
