import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class ProjectHome {

    public static void main(String[] args) {
        
        // Create a map that stores project home's properties
        Map<String, String> projectHomeProperties = new HashMap<String, String>();
        projectHomeProperties.put("owner", "Gabe");
        projectHomeProperties.put("location", "New York City");
        projectHomeProperties.put("type", "apartment");
        projectHomeProperties.put("occupants", "Gabe and two roommates");
        projectHomeProperties.put("year", "2020");
        
        // Create a list that stores project home's amenities
        List<String> projectHomeAmenities = new ArrayList<String>();
        projectHomeAmenities.add("laundry");
        projectHomeAmenities.add("full kitchen");
        projectHomeAmenities.add("high-speed internet");
        projectHomeAmenities.add("central AC");
        projectHomeAmenities.add("gym");
        
        // Create a method that prints a project home's properties
        public static void printProjectHomeProperties(Map<String, String> projectHomeProperties) {
            for (Map.Entry<String, String> entry : projectHomeProperties.entrySet()) {
                System.out.println(entry.getKey() + ": " + entry.getValue());
            }
        }
        
        // Create a method that prints a project home's amenities
        public static void printProjectHomeAmenities(List<String> projectHomeAmenities) {
            System.out.print("Amenities: ");
            for (String amenity : projectHomeAmenities) {
                System.out.print(amenity + ", ");
            }
        }
        
        // Print the project home's properties
        printProjectHomeProperties(projectHomeProperties);
        
        // Print the project home's amenities
        printProjectHomeAmenities(projectHomeAmenities);

    }

}