class Label < ActiveRecord::Base
  belongs_to :labelable, polymorphic: true
  
  def self.update_labels(label_string)
    new_labels = []
    unless label_string.empty?
      label_string.split(",").each do |label|
        label_name = label.strip
        new_label = Label.find_or_create_by(name: label_name)
        new_labels << new_label
      end
    end
    new_labels
  end
end
