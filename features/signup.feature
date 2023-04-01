Feature: sign up
  As a new user
  I need to be able to sign up with my new email
  The app should be able to create a new account for me

	Scenario: sign up account
  		Given I am on the sign-up page
  		Then I should see "Sign Up"
  		And I fill in "name" with "admin1"
  		And I fill in "email" with "admin1@gmail.com"
  		And I fill in "password" with "admin1"
  		And I fill in "password_confirmation" with "admin1"
  		And I press "Sign Up"
  		Then I should see "Successfully created account! Automatically logged in!"
  		Then I should see "Create a new plan"
  		








# 	Scenario: log in with admin account
#   		Given I am on the home page
#   		Then I should see "Plannxt"
#   		Then I should see the canvas
#   		Then I should see the item menue

# 	Scenario: View canvas page
#   		Given I am on the canvas page
#   		Then I should see "Plannxt"
#   		Then I should see the canvas
#   		Then I should see the item menue
  		
	# Scenario: Show saved data
  	# 	Given I have received the saved data
  	# 	Then I should see event icons on canvas

