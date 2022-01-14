
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
        super
    end


    def select_build(build)

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