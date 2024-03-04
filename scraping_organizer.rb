require "selenium-webdriver"
require "interactor"
require_relative "search_item"
require_relative "get_titles"

class ScrapingOrganizer
    include Interactor::Organizer

    organize SearchItem, GetTitles
end