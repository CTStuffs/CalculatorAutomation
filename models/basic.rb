class BasicModel
    require 'selenium-webdriver'

    DEFAULT_WIDTH = 1600
    DEFAULT_HEIGHT = 900

    def initialize(driver, url)
        @@driver = driver
        @@BASE_URL
    end


    def visit
        @@driver.manage.window.resize_to(1600, 900)
        @@driver.get(@@BASE_URL)
    end

    
    def cleanup
        @@driver.quit
    end 

end