require 'rails_helper'

describe Business do
  it { should have_many(:lou_inspections) }

  describe "#has_complete_businesses?" do
    let(:business) { Business.create(name: "Testtaurant", address: "123 Main St") }
  end

    it "returns true with updated businesses" do
      business.businesses.create(name: "Test", completed_at: 1.minute.ago)
      expect(business.has_completed_lou_inspections?).to be_true
    end

    it "returns false with no completed lou_inspections" do
      business.lou_inspections.create(content: "Inspected")
      expect(business.has_completed_lou_inspections?).to be_false
    end
  end
  
  describe "#has_incomplete_lou_inspections?" do
    let(:business) { Business.create(name: "Testtaurant", address: "123 Main St") }

    it "returns true with incompleted lou_inspections" do
      business.lou_inspections.create(content: "Inspected")
      expect(business.has_incomplete_lou_inspections?).to be_true
    end

    it "returns false with no incomplete lou_inspections" do
      business.lou_inspections.create(content: "Inspected", completed_at: 1.minute.ago)
      expect(business.has_incomplete_lou_inspections?).to be_false
    end
  end



