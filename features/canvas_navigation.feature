Feature: Canvas page navigation
  As a user
  I need to see the list of my plans
  The canvas page should have navigation that allows me to see the list of my plans

	Scenario: canvas page navigation
	  	#Given I am on the sign-in page
	  	#Then I should see "Sign In"
		#And I fill in "email_username" with "admin"
		#And I fill in "password" with "admin"
		#And I press "submit"
		#Then I should see "Logged in successfully"
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
		

