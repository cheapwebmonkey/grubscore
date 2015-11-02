require 'rails_helper'

describe "Creating new Business entries", :type => :feature do
	it "redirects to the businesses index page on success" do
		visit "/businesses"
		click_link "Add new business"
		expect(page).to have_content("Add new business")
	end
end