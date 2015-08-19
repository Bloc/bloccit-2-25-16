class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name, :unique => true
      t.references :labelable, polymorphic: true, index: true
      t.integer :labelable_id

      t.timestamps null: false
    end
  end
end
