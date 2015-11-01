require 'rails_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Darth",
      last_name: "Vader",
      email: "vader@deathstar.com",
      password: "deathstar1234",
      password_confirmation: "deathstar1234"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do 
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "VADER@DEATHSTAR.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "vader"
      expect(user).to_not be_valid
    end
    
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "VADER@DEATHSTAR.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("VADER@DEATHSTAR.COM").
        to("vader@deathstar.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "BOSS@DEATHSTAR.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("boss@deathstar.com")
    end
  end
end
