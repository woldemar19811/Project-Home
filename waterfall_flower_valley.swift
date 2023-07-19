import UIKit
import Foundation

class ProjectHomeViewController: UIViewController {

    // Properties
    private var projectName: String = ""
    private var projectDescription: String = ""
    private var projectIssues: [String] = []

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        fetchData()
    }

    // MARK: - Helper Functions
    func setupViews() {
        // Setup views
    }

    func fetchData() {
        // Fetch data
    }

    // MARK: - UI Interaction
    @objc func handleButtonTapped() {
        // Handle button tap
    }

    // MARK: - Custom Functions
    func showProjectInfo() {
        // Show project info
    }

    func showProjectIssues() {
        // Show project issues
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "projectInfoSegue" {
            let destVC = segue.destination as? ProjectInfoViewController
            destVC?.projectName = self.projectName
            destVC?.projectDescription = self.projectDescription
        } else if segue.identifier == "projectIssuesSegue" {
            let destVC = segue.destination as? ProjectIssuesViewController
            destVC?.projectIssues = self.projectIssues
        }
    }

}