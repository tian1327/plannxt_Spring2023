Feature: Canvas page
  As a planner
  I need to see the canvas page of my plan
  The canvas page should read saved events and display them 

# 	Scenario: sign up account
#   		Given I am on the sign-up page
#   		Then I should see "Sign Up"
#   		And I fill in "name" with "admin"
#   		And I fill in "email" with "admin@gmail.com"
#   		And I fill in "password" with "admin"
#   		And I fill in "password_confirmation" with "admin"
#   		And I press "Sign Up"
#   		Then I should see "Successfully created account! Automatically logged in!"
#   		Then I should see "Create a new plan"
  		
	Scenario: sign in account
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "admin"
  		And I fill in "password" with "admin"
  		And I press "submit"
  		Then I should see "Logged in successfully"
  		Then I should see "Create a new plan"    
  		And I click "Create a new plan"
  		Then I should see "Add Steps"
  		
    

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

