Feature: addstep
  As a user
  I need to be able to add and delete steps to my events
  The events planninng page should have a form to add steps to the event
  
  Background: users in database

  Given the following users exist:
  | name        | email               | password     | 
  | user1       | user1@email.com     | abc          |  
  | user2       | user2@email.com     | abc          |  
  | admin       | admin@email.com     | abc          | 

  Given the following plan exist:
  |name|
  |demo|
  ||

  	Scenario: sign in account and create a new plan
  		Given I am on the sign-up page
  		Then I should see "Sign Up"
  		And I fill in "name" with "admin1"
  		And I fill in "email" with "admin1@gmail.com"
  		And I fill in "password" with "admin1"
  		And I fill in "password_confirmation" with "admin1"
  		And I press "Sign Up"
  		Then I should see "Successfully created account! Automatically logged in!"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I click "Add Steps"
		Then I should see "Add Steps"
		When I select checkbox "Delete"
		Then I should see "Add Steps"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		
		
	Scenario: plan model page plan deletion
        Given I am on the sign-up page
  		Then I should see "Sign Up"
  		And I fill in "name" with "admin1"
  		And I fill in "email" with "admin1@gmail.com"
  		And I fill in "password" with "admin1"
  		And I fill in "password_confirmation" with "admin1"
  		And I press "Sign Up"
  		Then I should see "Successfully created account! Automatically logged in!"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Delete"
		And I click "Delete"
		Then I should see "'demo' deleted successfully"

	Scenario: plan model page plan edit
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Edit"
		And I click "Edit"
		Then I should see "Return to Plans"
		And I click "Return to Plans"
		Then I should see "Edit"

	
	Scenario: plan model page plan manage
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Manage"
		And I click "Manage"
		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo1"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "Furniture"
		Then I should see "Save"
		And I press "Save"
		Then I should see "Check Dependency"
		And I press "Check Dependency"
		
	Scenario: plan model page plan copy
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Copy"
		And I click "Copy"
	
	Scenario: plan model page plan export
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Export"
		And I click "Export"
		Then I should see "demo"
	
	Scenario: plan model page plan share
  		Given I am on the sign-in page
  		Then I should see "Sign In"
  		And I fill in "email_username" with "user1@email.com"
  		And I fill in "password" with "abc"
  		And I press "submit"
		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Share"
		And I click "Share"
		Then I should see "Share with"
		And I fill in "Share with" with "user2"
		And I press "Share with user"
		Then I should see "'demo' shared with user2"
		Then I should see "Share"
		And I click "Share"
		Then I should see "Share with"
		And I fill in "Share with" with "user3"
		And I press "Share with user"
		Then I should see "User not found"


	