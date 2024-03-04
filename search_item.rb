require "selenium-webdriver"
require "interactor"
require "pry"

class SearchItem
    include Interactor 
    def call
        fill_form(context.driver, context.wait, context.search_str) #context comes from interactor
    end

    private 

    def fill_form(driver, wait, search_str)
        search_input = wait.until do
            driver.find_element(:css, 'body > header > div > form > input')
        end
    end
end

