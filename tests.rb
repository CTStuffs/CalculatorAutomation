require_relative('models/calculator')
require 'minitest/autorun'
require 'selenium-webdriver'
require 'webdrivers'

#iterate through prototype, 1-9 builds

class CalculatorTests < MiniTest::Test
    def setup
        @browser = Selenium::WebDriver.for :firefox
        @browser.manage.timeouts.implicit_wait = 5
        @calculator = CalculatorPage.new(@browser, "https://testsheepnz.github.io/BasicCalculator.html")
        @calculator.visit
        @calculator.select_build("0")
    end


   

    def test_addition_1
        @calculator.select_operation("Add")
        answer = @calculator.enter_nums(10, 12)
        assert_equal("22", answer)  
    end

    # def test_addition_2
    #     val1 = 9999999999
    #     val2 = -999999999
    #     @calculator.select_operation("Add")
    #     answer = @calculator.enter_nums(val1, val2)
    #     assert_equal(9000000000, answer)  

    #     @calculator.click_clear

    #     @calculator.select_operation("Add")
    #     answer = @calculator.enter_nums(val2, val1)
    #     assert_equal(9000000000, answer) 
        
    #     @calculator.click_clear
    # end
    
    # def test_subtraction_1
    #     @calculator.select_operation("Subtract")
    #     answer = @calculator.enter_nums(-999999999, -999999999)
    #     assert_equal(0, answer)
    #     @calculator.click_clear
    # end

    # def test_subtraction_2
    #     @calculator.select_operation("Subtract")
    #     answer = @calculator.enter_nums(100000, 23)
    #     assert_equal(answer, 99977)
    #     @calculator.click_clear
    # end

    def teardown
        @calculator.cleanup
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

#calculator = CalculatorPage.new(driver, "https://testsheepnz.github.io/BasicCalculator.html")
#calculator.visit
#calculator.select_build("1")
#calculator.cleanup