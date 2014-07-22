require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

  	before do
  		visit '/static_pages/home'
  	end 

  	it "should have the content 'SmartMoves'" do
  		expect(page).to have_content('SmartMoves')
  	end 

  	it "should have the correct title" do
  		expect(page).to have_title("SmartMoves | Home")
  	end 
  end 

  describe "About page" do

  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About Us')
  	end 
  end 
end 