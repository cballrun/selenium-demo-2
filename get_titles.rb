require "selenium-webdriver"
require "interactor"

class GetTitles
include Interactor
    def call
        content_array = context.wait.until do
            context.driver.find_elements(:css, "div.ui-search-result__content")
        end
        puts content_array.map { |listing| listing.find_element(:css, "a").attribute("title")}
    end
end