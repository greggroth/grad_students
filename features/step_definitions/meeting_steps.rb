Given /^I have a meeting on (\d+)\/(\d+)\/(\d+)$/ do |day, month, year|
  Meeting.create! date: Time.new(year, month, day)
end