require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LabelsHelper. For example:
#
# describe LabelsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LabelsHelper, type: :helper do
  describe "#update_labels" do
    it "takes a comma delimited string and returns an array of Labels" do
      labels = "#{label.name}, #{label2.name}"
      labels_as_a = [label, label2]

      expect(update_labels(labels)).to eq(labels_as_a)
    end
  end
end
