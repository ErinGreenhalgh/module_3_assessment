require "rails_helper"

RSpec.feature "user sees specific store data" do
  scenario "when they go to store show page" do
    visit 
    After I have searched a zip code for stores
When I click the name of a store
Then my current path should be "/stores/:store_id"
I should see the store name, store type and address with city, state and zip
I should see an unordered list of the store hours in the following format:
  * Mon: 10am-9pm
  * Tue: 10am-9pm
  * Wed: 10am-9pm
  * Thurs: 10am-9pm
  * Fri: 10am-9pm
  * Sat: 10am-9pm
  * Sun: 11am-7pm
  end
end
