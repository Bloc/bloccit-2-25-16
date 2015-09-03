class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :severity
      t.integer :topic_id
      t.integer :post_id
      t.references :topic, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
