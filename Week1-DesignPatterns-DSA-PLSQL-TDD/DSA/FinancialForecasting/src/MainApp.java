public class MainApp {
    public static void main(String[] args) {

        double initialValue = 1000.0;  // starting amount
        double growthRate = 0.10;      // 10% growth per year
        int years = 5;                 // predict 5 years ahead

        System.out.println("=== Financial Forecasting (Recursive) ===");
        System.out.println("Initial Value: Rs." + initialValue);
        System.out.println("Growth Rate: " + (growthRate * 100) + "% per year");
        System.out.println("Years: " + years);
        System.out.println();

        // Show value year by year
        for (int i = 1; i <= years; i++) {
            double futureValue = FinancialForecast.calculateFutureValue(
                                    initialValue, growthRate, i);
            System.out.printf("Year %d: Rs.%.2f%n", i, futureValue);
        }

        System.out.println();
        System.out.println("=== Recursion working correctly! ===");
    }
}