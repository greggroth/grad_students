Feature: View Professors
  In order to manage professors
  As a professor
  I should be able to view professors
  
  Scenario: View a list of professors
    Given a professor "prof1@gsu.edu" has an account
    And a professor "prof2@gsu.edu" has an account
    And a professor "smart_guy@gsu.edu" is logged in
    When I am on the professors page
    Then I should see "prof1@gsu.edu"
    And I should see "prof2@gsu.edu"
  
  Scenario: View a professors page
    Given a professor "prof1@gsu.edu" has an account
    And a professor "prof2@gsu.edu" has an account
    And a professor "smart_guy@gsu.edu" is logged in
    When I am on the page for the professor "prof2@gsu.edu"
    Then I should see "prof2@gsu.edu"
    
  Scenario: Create a new professor
    Given a professor "prof2@gsu.edu" is logged in
    When I am on the professors/new page
    And I fill in "First name" with "Bob"
    And I fill in "Last name" with "Barker"
    And I fill in "E-mail" with "bob.barker@gsu.edu"
    And I click button "Save"
    Then I should see "Bob Barker"
    And I should see "Professor was successfully created."

  Scenario: Edit an existing professor
    Given a professor "prof1@gsu.edu" has an account
    And a professor "prof2@gsu.edu" is logged in
    When I am on the professors page
    And I click link "John Smith"
    And I click link "Edit"
    And I fill in "First name" with "Bob"
    And I fill in "Last name" with "Barker"
    And I click button "Save"
    Then I should see "Bob Barker"
    And I should see "Professor was successfully updated."