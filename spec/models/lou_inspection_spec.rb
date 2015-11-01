require 'rails_helper'

describe LouInspection do
  it { should belong_to(:business) }

  describe "#created?" do
    let(:lou_inspection) { LouInspection.create(content: "Created") }

    it "is false when created_is blank" do
      lou_inspection.created_at = nil
      expect(lou_inspection.completed?).to be_false
    end

    it "returns true when created_at is not empty" do
      lou_inspection.created_at = Time.now
      expect(lou_inspection.created?).to be_true
    end
  end
end
