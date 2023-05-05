Feature: sign in
  As ann existing user
  I need to be able to sign in with my new email
  The app should be able to log me in

  Background: users in database

  Given the following users exist:
  | name        | email               | password     | 
  | user1       | user1@email.com     | abc          |  
  | user2       | user2@email.com     | abc          |  
  | admin       | admin@email.com     | abc          |  



	Scenario: sign in account and create a new plan
  		Given I am on the sign-in page
  		Then I should see "Sign In"
		Then I should see "Forgot your password?"
		And I click "Forgot your password"
		Then I should see "Forgot your password?"
		And I fill in "email" with "admin"
		And I press "Reset Password"
#		Then I should see "Please check your email to reset the password"
#  		And I fill in "email" with "admin"
#  		And I fill in "password" with "admin"
#  		And I press "submit"
#  		Then I should see "Logged in successfully"
#  		Then I should see "Create a new plan"    
#  		And I click "Create a new plan"
#  		Then I should see "Add Steps"
	
	Scenario: sign in to eexisting account
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Logged in successfully"
  		Then I should see "Create a new plan"  
	
	Scenario: sign in and sign out
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Logged in successfully"
  		Then I should see "Logout" 
		And I press "Logout"
		Then I should see "Logged Out" 
	Scenario: sign in and sign out as admin
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "admin@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Logged in successfully"
  		Then I should see "Logout" 
		And I press "Logout"
		Then I should see "Logged Out"

