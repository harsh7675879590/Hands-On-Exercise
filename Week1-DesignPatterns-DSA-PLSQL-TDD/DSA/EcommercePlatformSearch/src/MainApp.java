public class MainApp {
    public static void main(String[] args) {

        // Products for linear search (unsorted is fine)
        Product[] products = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Phone", "Electronics"),
            new Product(3, "Shirt", "Clothing"),
            new Product(4, "Shoes", "Footwear"),
            new Product(5, "Watch", "Accessories")
        };

        // Linear Search
        System.out.println("=== Linear Search ===");
        int linearResult = LinearSearch.linearSearch(products, "Shirt");
        if (linearResult != -1) {
            System.out.println("Product found at index: " + linearResult);
            System.out.println("Product name: " + products[linearResult].productName);
        } else {
            System.out.println("Product not found");
        }

        // Products for binary search (MUST be sorted alphabetically)
        Product[] sortedProducts = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Phone", "Electronics"),
            new Product(3, "Shirt", "Clothing"),
            new Product(4, "Shoes", "Footwear"),
            new Product(5, "Watch", "Accessories")
        };

        // Binary Search
        System.out.println("\n=== Binary Search ===");
        int binaryResult = BinarySearch.binarySearch(sortedProducts, "Shirt");
        if (binaryResult != -1) {
            System.out.println("Product found at index: " + binaryResult);
            System.out.println("Product name: " + sortedProducts[binaryResult].productName);
        } else {
            System.out.println("Product not found");
        }
    }
}