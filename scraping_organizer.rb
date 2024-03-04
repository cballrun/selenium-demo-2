require "selenium-webdriver"
require "interactor"
require_relative "search_item"

class ScrapingOrganizer
    include Interactor::Organizer

    organize SearchItem
end