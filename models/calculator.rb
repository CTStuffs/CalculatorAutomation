
require 'selenium-webdriver'
require_relative 'basic'

class CalculatorPage
    
    BUILD_DROPDOWN = { id: 'selectBuild'}
    NUM_FIRST = { id: 'number1Field'}
    NUM_SECOND  = { id: 'number2Field'}
    OPERATION_DROPDOWN = { id: 'selectOperationDropdown'}
    CALC_BUTTON = { id: 'calculateButton'}
    ANSWER_FIELD = { id: 'numberAnswerField'}
    INTEGERS_ONLY = { id: 'integerSelect'}
    CLEAR_BTN = { id: 'clearButton'}


    def initialize(driver, url)
        superef select_build(build)
        dropdown 
    end


    d= @@driver.find_element(BUILD_DROPDOWN)
        choose = Selenium::WebDriver::Support::Select.new(dropdown)
        
        dropdown.click
        choose.select_by(:value, build)


    end

    def enter_first_num(val)

    end

    def enter_second_num(val)
    end

    def select_operation(op)

    end

    def click_calc
    end

    def check_answer(answer)
    end

    def toggle_ints_only
        
    end
    


end