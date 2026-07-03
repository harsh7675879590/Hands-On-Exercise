public class LinearSearch {
    
    public static int linearSearch(Product[] products, String targetName) {
        
        // check every element one by one
        for (int i = 0; i < products.length; i++) {
            if (products[i].productName.equals(targetName)) {
                return i; // found it, return the index
            }
        }
        return -1; // not found
    }
}