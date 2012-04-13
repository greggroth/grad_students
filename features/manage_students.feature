Feature: manage students
  In order to manage students
  As a professor
  I should be able to view students
  
  Scenario: professor can create a students
    Given a professor "smart_guy@gsu.edu" is logged in
    When I am on the students/new page
    And BREAKPOINT
    And I fill in "First name" with "Bobby"
    And I fill in "Last name" with "Brown"
    And I click button "Submit"
    Then I should see "Bobby Brown"