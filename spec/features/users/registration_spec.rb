require "rails_helper"

describe "Signing up" do
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(2)
		visit "/"
		expect.page.to have_content("Sign Up")
		click_link "SIgn Up"

		fill_in "First Name", name: "Darth"
		fill_in "Last Name", name: "Vader"
		fill_in "Email", email: "vader@deathstar.com"
		fill_in "Password", password: "deathstar1234"
		fill_in "Password (again)", password: "deathstar1234"
		click_button "Sign Up"

		expect(User.count).to eq(2)
	end

end