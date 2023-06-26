// Code for Project Home

fn main() {
    println!("Welcome to Project Home!");

    let mut total_cost: f64 = 0.00;

    let mut room_dimensions: Vec<(u32, u32, u32)> = Vec::new();

    // Prompt user for the number of rooms
    println!("How many rooms will there be?");

    // Read user input for the number of rooms
    let mut num_rooms = String::new();
    std::io::stdin().read_line(&mut num_rooms)
        .expect("Failed to read line");
    let num_rooms: u32 = num_rooms.trim().parse()
        .expect("Please type a number!");

    // Prompt user for the dimension of each room
    println!("What are the dimensions (length, width, height) of each room?");

    for _ in 0..num_rooms {
        // Read user input for room dimensions
        let mut room_dim = String::new();
        std::io::stdin().read_line(&mut room_dim)
            .expect("Failed to read line");

        let mut iter = room_dim.split_whitespace();
        let length: u32 = iter.next().unwrap().parse().unwrap();
        let width: u32 = iter.next().unwrap().parse().unwrap();
        let height: u32 = iter.next().unwrap().parse().unwrap();
        room_dimensions.push((length, width, height));
    }

    // Calculate total cost
    for dim in room_dimensions {
        let (length, width, height) = dim;
        // Calculate total area
        let total_area: f64 = (length as f64 * width as f64 + width as f64 * height as f64 + height as f64 * length as f64) * 2.0;
        // Calculate price per square feet
        let price_per_sq_ft: f64 = total_area * 10.00;
        // Sum up total cost
        total_cost += price_per_sq_ft;
    }

    println!("The total cost is: ${}", total_cost);
}