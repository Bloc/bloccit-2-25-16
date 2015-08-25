class CreateLabelings < ActiveRecord::Migration
  def change
    create_table :labelings do |t|
		  t.integer  "label_id"
		  t.string   "labelable_type"
		  t.integer  "labelable_id"
		  t.datetime "created_at",    :null => false
		  t.datetime "updated_at",    :null => false

      t.timestamps null: false
    end
  end
end
