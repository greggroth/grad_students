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