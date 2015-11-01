require 'rails_helper'

describe "Deleting businesses" do
  let!(:business) { Business.create(name: "Name", address: "Address") }

  it "is successful when clicking the destroy link" do
    visit "/businesses"

    within "#business_#{business.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(business.name)
    expect(Business.count).to eq(0)
  end
end