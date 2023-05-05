Given(/the following users exist/) do |user_table|
  user_table.hashes.each do |user|
    User.create user
  end
end

Given(/the following plan exist/) do |plan_table|
  plan_table.hashes.each do |plan|
    plan1 = PlanModel.create plan
    
  end
end


Given('I am on the home page') do
  #pending # Write code here that turns the phrase above into concrete actions
  Article.create!()
  visit "/login"
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then('I should not see {string}') do |string|
  expect(page).to have_no_content(string)
end


Then('I should see the canvas') do 
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_xpath("//div[@class='canvas']")
end

Then('I should see the item menu') do 
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_xpath("//div[@id='editing_page']")
end

Given('I have received the saved data') do
  #pending # Write code here that turns the phrase above into concrete actions
  visit "/articles_json"
  visit "/login"
end

Then('I should see event icons on canvas') do 
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_xpath("//div[@class='sourceItems' and @id='src_copy0']")
end

Given('I am on the canvas page') do
  visit 'edit_page/'
  # visit "/login"
  # visit "plan_models/:id/draw_panel"
end


Given('I am on the sign-up page') do
  visit 'sign_up/'
end

Given('I am on the sign-in page') do
  visit 'sign_in/'
end

When /^(?:|I )click "([^"]*)"$/ do |link|
  click_link(link)
  # find('tr', text: plant_name).click_link('Select')
end


When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

# When I select checkbox
When(/^I select checkbox "(.*?)"$/) do |cb|
  check(cb)
end