require 'spec_helper'

describe "Creating new Business entries" do
	it "redirects to the businesses index page on success" do
		visit "/businesses"
		click_link "Add new business"
		expect(page).to have_content("New business")
	end
end