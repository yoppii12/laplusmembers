class CreateEmergencies < ActiveRecord::Migration[5.1]
  def change
    create_table :emergencies do |t|
      t.string :name
      t.string :email
      #緊急停止ボタンで売買のステータスを変更できるようにする
      #通常0、買い停止1、売り停止2、売り買い停止3、全売り4
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
