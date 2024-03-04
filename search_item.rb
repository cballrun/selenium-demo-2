require "selenium-webdriver"
require "interactor"
require "pry"

class SearchItem
    include Interactor 
    def call
        fill_form(context.driver, context.wait, context.search_str) #context comes from interactor
        submit_form(context.driver, context.wait)
        sleep 2
    end

    private 

    def fill_form(driver, wait, search_str)
        search_input = wait.until do
            driver.find_element(:css, "input")
        end
        search_input.send_keys search_str
    end

    def submit_form(driver, wait)
        submit_button = wait.until do
            driver.find_element(:css, "button.nav-search-btn")
        end
        submit_button.click
    end
end

