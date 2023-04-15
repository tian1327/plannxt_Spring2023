Feature: addstep
  As a user
  I need to be able to add and delete steps to my events
  The events planninng page should have a form to add steps to the event

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