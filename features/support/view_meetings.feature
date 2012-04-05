Feature: View Meetings
  In order to manage meetings
  As a professor
  I should be able to view meetings
  
  Scenario: View a list of meetings
    Given I have a meeting on 1/1/2012
    And I have a meeting on 1/2/2012
    And a professor "smart_guy@gsu.edu" is logged in
    When I am on the meetings page
    Then I should see a link to "January 1 2012"
    And I should see a link to "January 1 2012"