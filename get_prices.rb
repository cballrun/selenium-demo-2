require "selenium-webdriver"
require "interactor"

class GetPrices
include Interactor
    def call
        while next_page_button_visible?(context.wait, context.driver) do
            print_prices(context.driver, context.wait)
            next_page_link(context.driver)
            next_page_button(context.driver)
        end
    end

        private 



        def next_page_button(driver)
            next_button = driver.find_element(:css, "li.andes-pagination__button.andes-pagination__button--next")
        end

        def next_page_link(driver)
            next_button = driver.find_element(:css, "li.andes-pagination__button.andes-pagination__button--next")
            next_page_link = next_button.find_element(:css, "a").attribute("href")
            driver.get next_page_link
        end

        def next_page_button_visible?(wait, driver)
            wait.until { next_page_button(driver).displayed? }
        end

        def print_prices(driver, wait)
            content_array = context.wait.until do
                context.driver.find_elements(:css, "div.ui-search-result__content")
            end
            puts content_array.map { |listing| listing.find_element(:css, "span.andes-money-amount__fraction").text }
        end
end