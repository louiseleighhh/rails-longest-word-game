require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test 'Fill the form with random word, click button and get message its not in the grid' do
    visit new_url
    fill_in('form', :with => 'dpg')
    click_on 'button'
    has_css? 'p', text: 'Sorry but DPG does not seem to be a valid English word..'
  end

  test 'Fill the form with random word, submit and get message its not English' do
    visit new_url
    fill_in('form', :with => 'abcdefghijk')
    click_on 'button'
    has_css? 'p', text: "Sorry but ABCDEFGHIJK can't be built out of #{@letters}"
  end

  test 'Fill the form with valid word, submit and get "Congrats"' do
    visit new_url
    fill_in('form', :with => 'dog')
    click_on 'button'
    has_css? 'p', text: "CONGRATULATIONS! DOG is a valid English word!"
  end
end
