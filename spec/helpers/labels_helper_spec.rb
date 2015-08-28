require 'rails_helper'

RSpec.describe LabelsHelper, type: :helper do
  let(:label) { Label.create!(name: 'Label') }
  let(:label2) { Label.create!(name: 'Label2') }

  describe "#update_labels" do
    it "takes a comma delimited string and returns an array of Labels" do
      labels = "#{label.name}, #{label2.name}"
      labels_as_a = [label, label2]
      expect(update_labels(labels)).to eq(labels_as_a)
    end
  end
end
