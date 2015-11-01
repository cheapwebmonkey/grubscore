require 'spec_helper'
	describe User do
		let(:valid_attributes) {
			{
				first_name: "Darth",
				last_name: "Vader",
				email: "vader@deathstar.com"
			}
		}
		context "validations" do
			let(:user) {User.new(valid_attributes)}
			it "requires an email" do
				expect(user).to validate_presence_of(:email)
			end
		end
end