class AddLabelableToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :labelable_id, :integer
  end
end
