import scala.util.Random

// This class will manage the interactions with the user
// and handle the logic of the game
class ProjectHome {
  // This holds the list of squares the user has conquered
  var conqueredSquares: Array[String] = Array()

  // This will generate a random integer between min and max
  def generateRandomNumber(min:Int, max:Int): Int = {
    val rand = Random
    return rand.nextInt(max - min + 1) + min
  }

  // This will generate a random position of a square
  def generateRandomPosition(): (Int, Int) = {
    val x = generateRandomNumber(1, 30)
    val y = generateRandomNumber(1, 30)

    return (x, y)
  }

  // This will add a new conquered area to the conquered list
  def addConqueredArea(name: String, position: (Int, Int)) {
    conqueredSquares :+= (name + ": (" + position._1 + ", " + position._2 + ")")
  }

  // This will check if a given position is already conquered or not
  def hasPositionBeenConquered(position: (Int, Int)): Boolean = {
    var isConquered = false

    // Loop through every conquered area
    for (conqueredArea <- conqueredSquares) {
      // Split the conquered area to get the position
      val conqueredPosition = conqueredArea.split(": \\(")(1).split("\\)")(0).split(", ")
      val x = conqueredPosition(0).toInt
      val y = conqueredPosition(1).toInt

      // Check if the coordinates match
      if (x == position._1 && y == position._2) {
        isConquered = true
      }
    }

    return isConquered
  }

  // This will generate a new conquered square
  def getNewConqueredSquare(): (String, (Int, Int)) = {
    val name = "Square " + (conqueredSquares.length + 1)

    // Generate a new position
    var position = generateRandomPosition()

    // If the position has already been conquered, regenerate it
    while (hasPositionBeenConquered(position)) {
      position = generateRandomPosition()
    }

    // Add the conquered area to the list
    addConqueredArea(name, position)

    // Return the conquered area
    return (name, position)
  }

  // This will display the list of conquered squares
  def displayConqueredAreas() {
    println("Conquered Areas:")
    for (conqueredArea <- conqueredSquares) {
      println(conqueredArea)
    }
  }
}

// Create a new instance of the ProjectHome class
val projectHome = new ProjectHome()

// Generate a new conquered square
val conqueredSquare = projectHome.getNewConqueredSquare()

// Display the conquered area's name and position
println("Name: " + conqueredSquare._1)
println("Position: (" + conqueredSquare._2._1 + ", " + conqueredSquare._2._2 + ")")

// Display all of the conquered areas
projectHome.displayConqueredAreas()