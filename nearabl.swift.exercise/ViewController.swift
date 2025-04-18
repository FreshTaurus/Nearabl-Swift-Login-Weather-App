import UIKit

// This is the main login screen controller
class ViewController: UIViewController {

    // These connect to the Email and Password text fields in your storyboard
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    // Called automatically when the screen first loads
    override func viewDidLoad() {
        super.viewDidLoad()

        // 👇 Add a tap gesture to dismiss the keyboard when tapping outside input fields
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // This runs when the user taps the Login button
    @IBAction func loginTapped(_ sender: UIButton) {
        // Safely unwrap and check if both fields are filled in
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty, !password.isEmpty else {
            // If either is empty, show an alert
            showAlert(message: "Please enter both email and password.")
            return
        }

        // Predefined list of allowed emails and the valid password
        let validEmails = ["intern@nearabl.com", "hello@nearabl.com"]
        let validPassword = "2025"

        // Check if login is valid
        if validEmails.contains(email.lowercased()) && password == validPassword {
            // ✅ Credentials are valid — go to Welcome screen
            navigateToWelcome(email: email)
        } else {
            // ❌ Show error if login fails
            showAlert(message: "Invalid credentials.")
        }
    }

    // This function handles the transition to the Welcome screen
    func navigateToWelcome(email: String) {
        // Load the Main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Try to create the WelcomeViewController screen using its storyboard ID
        if let welcomeVC = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController {
            // Pass the user's email to the Welcome screen
            welcomeVC.userEmail = email

            // Show the Welcome screen in full-screen mode
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true, completion: nil)
        }
    }

    // This shows a simple alert box with a message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // This is triggered when tapping outside the text fields
    // It tells the keyboard to hide
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
