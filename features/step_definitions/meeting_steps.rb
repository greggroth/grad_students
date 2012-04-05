Given /^I have a meeting on (\d+)\/(\d+)\/(\d+)$/ do | month, day, year |
  Meeting.create! date: Time.new(year, month, day)
end

When /^I am on the page for the meeting (\d+)\/(\d+)\/(\d+)$/ do | month, day, year |
  visit meeting_path( Meeting.find_by_date( Time.new(year, month, day)))
end