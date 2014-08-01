FactoryGirl.define do
	factory :user do
		name					"John Doe"
		email					"example@email.com"
		password				"foobar"
		password_confirmation	"foobar"
	end 
end	