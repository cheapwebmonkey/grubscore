require 'rails_helper'

describe "Editing businesses" do
  let!(:business) { Business.create(name: "Name", address: "Address") }

  def update_business(options={})
    options[:name] ||= "My Business"
    options[:address] ||= "This is my business address."
    business = options[:business]

    visit "/businesses"
    within "#business_#{business.id}" do
      click_link "Edit"
    end

    fill_in "Name", with: options[:name]
    fill_in "Address", with: options[:address]
    click_button "Update Business"
  end

  it "updates a business successfully with correct information" do
    update_business business: business, 
                     name: "New name", 
                     address: "New address"

    business.reload

    expect(page).to have_content("Business was successfully updated")
    expect(business.name).to eq("New name")
    expect(business.address).to eq("New address")
  end

  it "displays an error with no name" do
    update_business business: business, name: ""
    name = business.name
    business.reload
    expect(business.name).to eq(name)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a name" do
    update_business business: business, name: "hi"
    expect(page).to have_content("error")
  end

  it "displays an error with no address" do
    update_business business: business, address: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short an address" do
    update_business business: business, address: "hi"
    expect(page).to have_content("error")
  end
end