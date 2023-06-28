package main

import "fmt"

func main() {
	fmt.Println("Welcome to the Project Home!")
	// Define a slice of strings
	project_ideas := []string{"Organic Vegetable Garden","Solar Power System","Compost Bin","DIY Greenhouse","Upcycled Furniture","Garden Fence","Rainwater Harvesting System","Straw Bale Cabin","Outdoor Pizza Oven","Birdhouse"}

	// Loop through the list and print out each item
	fmt.Println("Here are some ideas for upcoming projects:")
	for i, project := range project_ideas {
		fmt.Printf("%d. %s\n", i+1, project)
	}

	// Ask user to enter project name
	var project_name string
	fmt.Println("What project would you like to do?")
	fmt.Scan(&project_name)

	// Check if the project name is in the list
	found := false
	for _, project := range project_ideas {
		if project == project_name {
			found = true
			fmt.Printf("Great! Let's get started with %s\n", project_name)
			break
		}
	}

	// If not found, tell user to check back later
	if !found {
		fmt.Println("Sorry, this project isn't available right now. Check back later!")
	}

	// Define a list of tools
	tools := []string{"Hammer","Drill","Shovel","Trowel","Level","Screwdriver","Saw"}

	// Ask user to enter a tool
	fmt.Println("What tool do you need to get started?")
	var tool string
	fmt.Scan(&tool)

	// Check if tool is in the list
	tool_found := false
	for _, t := range tools {
		if t == tool {
			tool_found = true
			fmt.Printf("Great! You need a %s to get started.\n", tool)
			break
		}
	}

	// If not found, tell user to check back later
	if !tool_found {
		fmt.Println("Sorry, this tool isn't available right now. Check back later!")
	}
}