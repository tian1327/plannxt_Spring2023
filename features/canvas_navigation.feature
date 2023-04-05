Feature: Canvas page navigation
  As a user
  I need to see the list of my plans
  The canvas page should have navigation that allows me to see the list of my plans

	Scenario: canvas page navigation
	  	Given I am on the sign-in page
	  	Then I should see "Sign In"
		And I fill in "email_username" with "admin"
		And I fill in "password" with "admin"
		And I press "submit"
		Then I should see "Logged in successfully"
		Then I should see "Create a new plan"
		Then I should see "Edit"
		And I click "Edit"
		Then I should see "rect room"
		Then I should see "Group"
		Then I should see "Mark"
		Then I should see "Finished"
		Then I should see "Save"
		Then I should see "Manage Details"
		Then I should see "Return to Plans"
		And I click "Return to Plans"
		Then I should see "Create a new plan"
		Then I should see "Edit"
		Then I should see "Delete"
		Then I should see "Manage"
		Then I should see "Export"
		Then I should see "Copy"
		Then I should see "Delete"
		

