public class Calculator {
    public int calculate(int firstOperand,int secondOperand,String operator){
        switch (operator){
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if (secondOperand!=0){
                    return firstOperand / secondOperand;
                }else{
                    throw new ArithmeticException("secondOperand khong duoc la 0");
                }
            default:
                throw new RuntimeException("error");
        }
    }
}
