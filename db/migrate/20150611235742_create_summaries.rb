class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.boolean :public, default:true
      t.text :description
      t.references :post

      t.timestamps null: false
    end
  end
end
