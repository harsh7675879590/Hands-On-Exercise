public class FinancialForecast {

    // Recursive method to calculate future value
    public static double calculateFutureValue(double currentValue, 
                                               double growthRate, 
                                               int years) {
        // Base case - stop here
        if (years == 0) {
            return currentValue;
        }

        // Recursive case - call itself with one less year
        return calculateFutureValue(currentValue * (1 + growthRate), 
                                     growthRate, 
                                     years - 1);
    }
}