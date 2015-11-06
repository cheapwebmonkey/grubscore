require 'rails_helper'

describe "Creating businesses" do
  let(:user) { create(:user) }

  def create_business(options={})
    options[:name] ||= "My Business"
    options[:address] ||= "This is my business address."

    visit "/businesses"
    # puts page.body
    click_link "Add New Business"

    expect(page).to have_content("GrubScore")

    fill_in "Name", with: options[:name]
    fill_in "Address", with: options[:address]
    # puts page.body
    click_button "Add New Business"
  end

  before do
    sign_in user, password: "deathstar1234"
  end

  it "redirects to the business index page on success" do
    create_business
    expect(page).to have_content("GrubScore")
  end

  it "displays an error when the business has no name" do
    expect(Business.count).to eq(2)

    create_business name: ""

    expect(page).to have_content("error")
    expect(Business.count).to eq(2)

    visit "/businesses"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the business has a name less than 3 characters" do
    expect(Business.count).to eq(2)

    create_business name: "Hi"

    expect(page).to have_content("error")
    expect(Business.count).to eq(2)

    visit "/businesses"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the business has no address" do
    expect(Business.count).to eq(2)

    create_business name: "Test Business", address: ""

    expect(page).to have_content("error")
    expect(Business.count).to eq(2)

    visit "/businesses"
    expect(page).to_not have_content("Test Business")
  end

  it "displays an error when the business has no address" do
    expect(Business.count).to eq(2)

    create_business name: "Test Business", address: "123 Test Place"

    expect(page).to have_content("error")
    expect(Business.count).to eq(2)

    visit "/businesses"
    expect(page).to_not have_content("Test Business")
  end
end