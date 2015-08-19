class AddLabelableToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :labelable_id, :integer
  end
end
