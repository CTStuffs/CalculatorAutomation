require_relative('models/calculator')
require 'minitest/autorun'
require 'selenium-webdriver'
require 'webdrivers'

#iterate through prototype, 1-9 builds

def CalculatorTests < MiniTest::test
    def setup
        @browser = Selenium::WebDriver.for :chrome
        @browser.manage.timeouts.implicit_wait = 30
        @@calculator = new CalculatorPage(@browser, "https://testsheepnz.github.io/BasicCalculator.html")
    end


    def teardown
        @browser.close();
    end


end


# operation tests: add, subtract, multiply, divide, concat
    # select option
    # make input
    # press button
    # check calc


#clear button: test with input in all, some or no fields
# integers only: test with all operations


#input types: all empty, some empty, none empty
#more input types: some chars, no chars, all chars
#even more input types: positive numbers, decimal numbers, negative numbers
#fringe cases: divide by zero, boundary cases

calculator = CalculatorPage.new(driver, "https://testsheepnz.github.io/BasicCalculator.html")
calculator.visit
calculator.select_build("1")
calculator.cleanup