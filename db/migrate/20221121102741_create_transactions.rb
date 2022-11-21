class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user , null: false , foriegn_key: true , index: true
      t.string :name 
      t.integer :amount
      t.timestamps
    end
  end
end
