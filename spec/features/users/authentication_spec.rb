require "rails_helper"

describe "Logging In" do
	it "logs the user in and goes to the businesses page" do
    	User.create(first_name: "Darth", last_name: "Vader", email: "vader@deathstar.com", password: "deathstar1234", password_confirmation: "deathstar1234")
		visit new_user_session_path
		fill_in "Email Address", with: "vader@deathstar.com"
		fill_in "Password", with: "incorrect"
		click_button "Log In"

		expect(page).to have_content("Businesses")
    	expect(page).to have_content("Thanks for logging in!")	

	end

	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "vader@deathstar.com"
		fill_in "Password", with: "incorrect"
		click_button "Log In"

		expect(page).to have_content("Please check your email and password")
		expect(page).to have_field("Email Address", with: "vader@deathstar.com")
	end
end