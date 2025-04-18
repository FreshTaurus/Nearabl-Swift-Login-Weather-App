import UIKit

class WelcomeViewController: UIViewController {

    // Label to display the user's email (connected from storyboard)
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!


    // This variable gets passed from the login screen
    var userEmail: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let email = userEmail {
            welcomeLabel.text = "Welcome, \(email)"
        }

        fetchWeather() // 🌤 Fetch and show weather
    }


    // Action for logout button
    @IBAction func logoutTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func fetchWeather() {
        let apiKey = "d7a3bcd702df83186bf5b74cf273c0ad" // Replace this
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=New+York&appid=\(apiKey)&units=imperial"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.weatherLabel.text = "Error loading weather"
                }
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let main = json["main"] as? [String: Any],
                   let temp = main["temp"] as? Double {
                    DispatchQueue.main.async {
                        self.weatherLabel.text = "NYC: \(temp)°F"
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.weatherLabel.text = "Failed to parse weather"
                }
            }
        }.resume()
    }


}
