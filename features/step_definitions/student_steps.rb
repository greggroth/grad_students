Given /^I have students named (.+)$/ do |students|
  students.split(',').each do |student|
    name = student.split(' ')
    Student.create!( first_name: name[0], last_name: name[1] )
  end
end

Given /^I am on the (.+) page$/ do |page|
  visit page
end

Then /^I should see "([^"]*)"$/ do |something_worth_seeing|
  page.should have_content something_worth_seeing
end

Then /^I should not see "([^"]*)"$/ do |something_misplaced|
  page.should_not have_content something_misplaced
end


Then /^I should see a link to "([^"]*)"$/ do |link_name|
  page.should have_link link_name
end


When /^I go to the page for the student (.+)$/ do |student|
  last_name = student.split(' ')[1]
  visit student_path(Student.find_by_last_name(last_name))
end

When /^I click button "([^"]*)"$/ do |button_name|
  click_button button_name
end

When /^I click link "([^"]*)"$/ do |link_name|
  click_link link_name
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, with: value
end