# Database

Given /^(?:I am|I have|I) signed up (?:as|with) "(.*)\/(.*)"$/ do |email, password|
  @user = FactoryGirl.create(:user, :email => email, :password => password)
end

# Session

Given /^(?:I am|I have|I) signed in (?:with|as) "(.*)\/(.*)"$/ do |email, password|
  step "I am signed up as \"#{email}/#{password}\""
  step "I sign in as \"#{email}/#{password}\""
end

Given /^I am signed in as an? (.*)$/ do |title|
  step 'I am signed in as "insider@example.com/asecret"'
  @user.roles += [title]
  @user.save
end

# Actions

When /^I sign in (?:with|as) "(.*)\/(.*)"$/ do |email, password|
  visit "/users/sign_in"
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Sign in"
end
