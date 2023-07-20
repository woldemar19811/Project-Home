//Class ProjectHome
class ProjectHome {

    // Variables for ProjectHome
    var projectName: String = ""
    var projectDescription: String = ""
    var totalProjectCost: Double = 0.0
    var totalProjectHours: Int = 0
    var estimatedProjectCompletionDays: Int = 0

    // Function to set project name
    fun setProjectName(name: String) {
        this.projectName = name
    }

    // Function to set project description
    fun setProjectDescription(description: String) {
        this.projectDescription = description
    }

    // Function to set total project cost
    fun setTotalProjectCost(cost: Double) {
        this.totalProjectCost = cost
    }

    // Function to set total project hours
    fun setTotalProjectHours(hours: Int) {
        this.totalProjectHours = hours
    }

    // Function to set estimated project completion days
    fun setEstimatedProjectCompletionDays(estimatedDays: Int) {
        this.estimatedProjectCompletionDays = estimatedDays
    }

    // Function to get project name
    fun getProjectName(): String {
        return this.projectName
    }

    // Function to get project description
    fun getProjectDescription(): String {
        return this.projectDescription
    }

    // Function to get total project cost
    fun getTotalProjectCost(): Double {
        return this.totalProjectCost
    }

    // Function to get total project hours
    fun getTotalProjectHours(): Int {
        return this.totalProjectHours
    }

    // Function to get estimated project completion days
    fun getEstimatedProjectCompletionDays(): Int {
        return this.estimatedProjectCompletionDays
    }

    // Function to calculate project cost per hour
    fun calculateProjectCostPerHour(): Double {
        return this.totalProjectCost / this.totalProjectHours
    }

}