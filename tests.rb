require_relative('models/calculator')
require 'minitest/autorun'
require 'selenium-webdriver'
require 'webdrivers'

#iterate through prototype, 1-9 builds

class CalculatorTests < MiniTest::Test



    INT_MAX = 9999999999
    INT_MIN = -999999999

    def setup
        @browser = Selenium::WebDriver.for :firefox
        @browser.manage.timeouts.implicit_wait = 5
        @calculator = CalculatorPage.new(@browser, "https://testsheepnz.github.io/BasicCalculator.html")
        @calculator.visit
        @calculator.select_build("0")
    end

    def perform_operation(op, val1, val2, result)
        @calculator.select_operation(op)
        answer = @calculator.enter_nums(val1, val2)
        assert_equal(result, answer)  
    end
   
    #basic addition test
    def test_addition_1
        # @calculator.select_operation("Add")
        # answer = @calculator.enter_nums(10, 12)
        # assert_equal("22", answer)  
        perform_operation("Add", 10, 12, "22")
    end

   #boundary limit test
    def test_addition_2
        perform_operation("Add", INT_MAX, INT_MIN, "9000000000")
    end

    # decimal numbers
    def test_addition_3       
        perform_operation("Add", 3.1415926, 441421.356, "441424.49759265")
    end

     # negative number addition
    def test_addition_4
        perform_operation("Add", -123456789 , -987654321, "9000000000")
    end

    # ordinary subtraction
    def test_subtraction_1
        perform_operation("Subtract", 123456, 54321,"177777")
    end

    # subtract into 0
    def test_subtract_2
        val1 = 10000
        val2 = val1
        perform_operation("Subtract", val1, val2, "0")
    end

    # boundary value cases, also subtracting a negative num
    def test_subtract_3
        perform_operation("Subtract", INT_MAX, INT_MIN, "10099999998")
    end

    # boundary value cases, also a negative num subtracting a positive one
    def test_subtract_4
        perform_operation("Subtract", INT_MIN, INT_MAX, "-10099999998")
    end

    # subtracting decimals
    def test_subtract_5
        perform_operation("Subtract", 3.12353426, 2.14532159, "-0.97821267")
    end

    #standard multiplication
    def test_multiply_1
        perform_operation("Multiply", 1234567, 90876312, "112192895876904")
    end

    # boundary value cases
    def test_multiply_2
        perform_operation("Multiply", INT_MAX, INT_MIN, "-9999999989000000000")
    end

    # multiplying two negatives
    def test_multiply_3
        perform_operation("Multiply", -123, -691, "84993")
    end

    # multiplying by 0
    def test_multiply_4
        perform_operation("Multiply", 0, -691, "0")
    end

    #decimal multiplication
    def test_multiply_5
        perform_operation("Multiply", 1234.56789, 1.123581321, "1387.1374194758148")
    end

    # standard division
    def test_divide_1
        perform_operation("Divide", 45, 5, "9")
    end

    # dividing into fractions
    def test_divide_2
        perform_operation("Divide", 10000, 20000000, 0.0005)
    end

    # divide by zero!
    def test_divide_3
        #perform_operation("Divide", INT_MAX - 1, 0, 0.0005)
        @calculator.select_operation("Divide")
        answer = @calculator.enter_nums(INT_MAX - 1, 0)
        assert_equal(@calculator.check_error_msg, "Divide by zero error!")
    end

    # 0 dividing a number
    def test_divide_4
        perform_operation("Divide", 0, INT_MIN, "0")
    end

    # boundary value case, also negative number dividing by positive
    def test_divide_5
        perform_operation("Divide", INT_MIN, INT_MAX, "-0.09999999991")
    end

    # standard concat
    def test_concat_1
        perform_operation("Concatenate", "the quick ", "brown fox ", "the quick brown fox ")
    end

    # concat with - sign
    def test_concat_2
        perform_operation("Concatenate", INT_MAX, INT_MIN, "9999999999-999999999")
    end

    #concat with + sign
    def test_concat_3
        perform_operation("Concatenate", "123456789+", "098651+312", "123456789+098651+312")
    end

    # random unicode test
    def test_concat_4
        perform_operation("Concatenate", "⸏⦀↉⫓Ⱋ⃴⋃ⰵⲸ⦒", "⎈≩⑂⾛⮷⺳☨⢃⁷⪊", "⸏⦀↉⫓Ⱋ⃴⋃ⰵⲸ⦒⎈≩⑂⾛⮷⺳☨⢃⁷⪊")
    end

    def test_concat_5
        perform_operation("Concatenate", "       ", "         3", "                   3")
    end
        
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