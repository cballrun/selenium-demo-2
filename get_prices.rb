require "selenium-webdriver"
require "interactor"

class GetPrices
include Interactor
    def call
        content_array = context.wait.until do
            context.driver.find_elements(:css, "div.ui-search-result__content")
        end
        puts content_array.map { |listing| listing.find_element(:css, "span.andes-money-amount__fraction").text }
    end
end