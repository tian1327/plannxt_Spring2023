Feature: password
  As an existing user
  I need to be able to edit and update password
  The app should be able to log me in
    
    Scenario: update and edit password
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
    
    Scenario: reset your password
  		Given I am on the sign-in page
  		Then I should see "Sign In"
		Then I should see "Forgot your password?"
		And I click "Forgot your password"
		Then I should see "Forgot your password?"
		And I fill in "email" with "admin"
		And I press "Reset Password"
		#Then I should see "Please check your email to reset the password"