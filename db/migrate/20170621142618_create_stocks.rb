class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :code
      t.string :bn
      t.string :sp
      t.string :dbr
      t.string :tr
      t.string :tru
      t.string :nsh

      t.timestamps
    end
  end
end
