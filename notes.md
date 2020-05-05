BostonMuseums::Scraper class:

-HTTParty.get(museum_list_url) line sends an HTTP request to the page we will scrape.We get a string the HTML of the top Boston Museums we’re scraping.
-Nokogiri::HTML(doc) line converts the HTML data to objects
-scraped_museums = index.css(".listing_details") line extracts all the needed list items
-scraped_museums.collect do |museum_content| this is the stage we iterate over each museum using collect to get the details of each museum

BostonMuseums::CLI class:

def run 
-welcomes the user and asks for input
-links user to user_input_loop instance method or allows for exit

def user_input_loop
-uses the user input to list all museums via list_museums method
-asks which museum they want to learn more about
-gives the details of the chosen museum via museum_details method
-offers many chances to the user to learn about another museum or exit if they are done
-if user input is invalid it offers user chance to proceed again

def list_museums
-list the museums in alphabetical order
-and they are indexed so we know how many museums the user will choose from

def museum_details
-user-input be within range of the number of museums (1..30)
-if input out of range it should inform the user of the invalid input and give them another chance to input again
-museum details given will be name, museum_site_url, museum_rating, museum_review_snippets

BostonMuseums::Museum class:

def initialize
-Use mass assignment method for getter and setter methods
-The method used is .send

EXECUTABLE FILE: bin/boston_museums
-should have the shebang line [#!/usr/bin/env ruby] to tell the program that the language being used is Ruby
