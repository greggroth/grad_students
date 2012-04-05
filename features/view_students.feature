Feature: View Students
  In order to manage students
  As a professor
  I should be able to view students
  
  Scenario: Professor can log in
    Given a professor "smart_guy@gsu.edu" has an account
    When I log in
    Then I should see "Signed in successfully"
    And I should see a link to "logout"
  
  Scenario: Students List
    Given I have students named John Smith, Cindy Lu
    And a professor "smart_guy@gsu.edu" has an account
    And he is logged in
    When I am on the students page
    Then I should see "John Smith"
    And I should see "Cindy Lu"
  
  Scenario: View a student's page
    Given I have students named John Smith, Cindy Lu
    And a professor "smart_guy@gsu.edu" is logged in
    When I go to the page for the student John Smith
    Then I should see "John Smith"