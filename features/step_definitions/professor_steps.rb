When /^I am on the page for the professor "([^"]*)"$/ do |email|
  visit professor_path( Professor.find_by_email(email) )
end

