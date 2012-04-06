When /^I am on the page for the professor "([^"]*)"$/ do |email|
  visit professor_path( Professor.find_by_email(email) )
end

Given /^he is logged in$/ do
  visit new_professor_session_path 
  fill_in 'E-mail', with: @professor.email
  fill_in 'Password', with: @professor.password
  click_button "Sign in"
end

Given /^a professor "([^"]*)" is logged in$/ do |email|
  @professor = Professor.create! first_name: "John", 
                                 last_name: "Smith", 
                                 email: email, 
                                 password: '123456', 
                                 password_confirmation: '123456'
   visit new_professor_session_path
   fill_in 'E-mail', with: @professor.email
   fill_in 'Password', with: @professor.password
   click_button "Sign in"
end

Given /^a professor "([^"]*)" has an account$/ do |email|
  @professor = Professor.create! first_name: "John", 
                                 last_name: "Smith", 
                                 email: email, 
                                 password: '123456', 
                                 password_confirmation: '123456'
end

When /^I log in$/ do
  visit new_professor_session_path
  fill_in 'E-mail', with: @professor.email
  fill_in 'Password', with: @professor.password
  click_button "Sign in"
end