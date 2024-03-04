require "selenium-webdriver"
require "interactor"

class GetPrices
include Interactor
    def call
        content_array = context.wait.until do
            context.driver.find_elements(:css, "div.ui-search-result__content")
        end
        puts content_array.map { |listing| listing.find_element(:css, "span.andes-money-amount__fraction").text }
        next_page_button(context.driver).click
        sleep 5
    end

        private 

        def next_page_button(driver)
            driver.find_element(:css, 'li.andes-pagination__button.andes-pagination__button--next')
        end
end