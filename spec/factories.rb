FactoryGirl.define do
	factory :user do
		first_name "First"
		last_name "Last"
		sequence(:email) { |n| "user#{n}@grubscore.com" }
		password "deathstar1234"
		password_confirmation "deathstar1234"
	end

end