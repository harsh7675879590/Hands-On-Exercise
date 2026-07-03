public class BinarySearch {
    
    public static int binarySearch(Product[] products, String targetName) {
        
        int left = 0;
        int right = products.length - 1;
        
        while (left <= right) {
            
            int mid = (left + right) / 2; // find middle
            int result = products[mid].productName.compareTo(targetName);
            
            if (result == 0) {
                return mid; // found it
            } else if (result < 0) {
                left = mid + 1; // target is in right half
            } else {
                right = mid - 1; // target is in left half
            }
        }
        return -1; // not found
    }
}