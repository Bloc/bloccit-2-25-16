class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.references :labelable, index: true
      t.references :topics, index: true
      t.references :posts, index: true

      t.timestamps null: false
    end
    add_foreign_key :labels, :labelables
    add_foreign_key :labels, :topics
    add_foreign_key :labels, :posts
  end
end
