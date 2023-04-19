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
	
	Scenario: Log out of account
  		Given I am on the sign-up page
  		Then I should see "Sign Up"
  		And I fill in "name" with "admin1"
  		And I fill in "email" with "admin1@gmail.com"
  		And I fill in "password" with "admin1"
  		And I fill in "password_confirmation" with "admin1"
  		And I press "Sign Up"
  		Then I should see "Successfully created account! Automatically logged in!"
  		Then I should see "Edit Password"
		And I click "Edit Password"
  		Then I should see "Logged in as"
		Then I should see "Password"
		#And I fill in "Password" with "admin2"
		#And I fill in "Password confirmation" with "admin2"
		And I press "Update"
		Then I should see "Password Updated"
