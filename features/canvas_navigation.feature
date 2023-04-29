Feature: Canvas page navigation
  As a user
  I need to see the list of my plans
  The canvas page should have navigation that allows me to see the list of my plans
  
  Background: users in database

  Given the following users exist:
  | name        | email               | password     | 
  | user1       | user1@email.com     | abc          |  

	Scenario: canvas page navigation
	  	Given I am on the sign-in page
	  	Then I should see "Sign In"
		And I fill in "email_username" with "user1@email.com"
		And I fill in "password" with "abc"
		And I press "submit"
		Then I should see "Logged in successfully"
  		Then I should see "Create a new plan"
		And I click "Create a new plan"
  		Then I should see "Add Steps"
		And I fill in "Plan Name" with "demo"
		And I press "OPEN PLAN TEMPLATE"
		Then I should see "demo created successfully"
		Then I should see "Edit"
		And I click "Edit"
		Then I should see "rect room"
		Then I should see "Group"
		Then I should see "Mark"
		Then I should see "Finished"
		Then I should see "Save"
		Then I should see "Return to Plans"
		And I click "Return to Plans"
		Then I should see "Create a new plan"
		Then I should see "Edit"
		Then I should see "Delete"
		Then I should see "Manage"
		Then I should see "Export"
		Then I should see "Copy"
		Then I should see "Delete"
		

