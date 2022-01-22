
require 'selenium-webdriver'
require_relative 'basic'

class CalculatorPage < BasicModel
    BUILD_DROPDOWN = { id: 'selectBuild'}
    NUM_FIRST = { id: 'number1Field'}
    NUM_SECOND  = { id: 'number2Field'}
    OPERATION_DROPDOWN = { id: 'selectOperationDropdown'}
    CALC_BUTTON = { id: 'calculateButton'}
    ANSWER_FIELD = { id: 'numberAnswerField'}
    INTEGERS_ONLY = { id: 'integerSelect'}
    CLEAR_BTN = { id: 'clearButton'}
    ERORR_MSG = { id: 'errorMsgField'}


    def initialize(driver, url)
        super
    end

    def visit
        super
    end


    def cleanup
        super
    end

    #def setup
    #    @browser = Selenium::WebDriver.for :chrome
    #    @browser.manage.timeouts.implicit_wait = 30
    #end


    def select_build(build)
        dropdown = @@driver.find_element(BUILD_DROPDOWN)
        choose = Selenium::WebDriver::Support::Select.new(dropdown)
        
        dropdown.click
        choose.select_by(:value, build)


    end


    def enter_nums(val1, val2)
        enter_first_num(val1)
        enter_second_num(val2)
        click_calc
        return check_answer
    end 

    def enter_first_num(val)
        @@driver.find_element(NUM_FIRST).send_keys(val)
    end

    def enter_second_num(val)
        @@driver.find_element(NUM_SECOND).send_keys(val)
    end

    def select_operation(op)
        dropdown = @@driver.find_element(OPERATION_DROPDOWN)
        choose = Selenium::WebDriver::Support::Select.new(dropdown)
        
        dropdown.click
    end

    def click_calc
        @@driver.find_element(CALC_BUTTON).click
    end

    def click_clear
        @@driver.find_element(CLEAR_BTN).click
    end

    def check_answer
        return @@driver.find_element(ANSWER_FIELD).attribute('value')
        #return (answer == ans) #asserting stuff is not the responsibility of the tester
    end


    def check_error_msg
        return @@driver.find_element(ERROR_MSG).text
    end

    def toggle_ints_only
        @@driver.find_element(INTEGERS_ONLY).click
    end
    


end