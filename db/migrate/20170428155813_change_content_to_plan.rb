class ChangeContentToPlan < ActiveRecord::Migration[5.0]
  def change
    # 変更内容
    def up
      change_column :plans, :description, null: false
      change_column :plans, :thubnail
    end

    # 変更前の状態
    def down
      change_column :plans, :description, null: false, default: ""
      change_column :plans, :thubnail,null: false, default: ""
    end
  end
end
