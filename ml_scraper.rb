require "selenium-webdriver"
require "interactor"
require_relative "scraping_organizer"

class MlScraper
    def initialize
        @driver = Selenium::WebDriver.for :chrome
        @search_str = "carros 4x4 diesel"
        @driver.get "https://www.mercadolibre.com.co"
        @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    end

    def scrape
       ScrapingOrganizer.call(
        driver: @driver,
        wait: @wait,
        search_str: @search_str
       )
       @driver.quit
    end
end

# MlScraper.new.scrape