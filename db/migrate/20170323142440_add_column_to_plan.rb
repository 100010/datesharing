class AddColumnToPlan < ActiveRecord::Migration[5.0]
  def change
    remove_reference :plans, :buy_history, forein_key: true
  end
end
