module LabelsHelper
  def labels_to_buttons(labels)
    raw labels.map { |l| link_to l.name, label_path(id: l.id), class: 'btn-xs btn-primary' }.join(' ')
  end

  def update_labels(label_string)
    new_labels = []
    unless label_string.nil? || label_string.empty?
      label_string.split(",").each do |label|
        label_name = label.strip
        new_label = Label.find_or_create_by(name: label_name)
        new_labels << new_label
      end
    end
    new_labels
  end
end