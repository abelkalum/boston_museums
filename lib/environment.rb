require_relative "./boston_museums/version"
require_relative "./boston_museums/cli"
require_relative "./boston_museums/scraper"
require_relative "./boston_museums/category"
require_relative "./boston_museums/museums"

require 'nokogiri'
require 'open-uri'
require 'pry'

module BostonMuseums
  class Error < StandardError; end
  # Your code goes here...
end
