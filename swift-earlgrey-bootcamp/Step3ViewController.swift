//
//  Step3ViewController.swift
//  swift-earlgrey-bootcamp
//
//  Created by Pivotal on 2017-05-08.
//
//

import UIKit

class Step3ViewController: UIViewController {

    let WEATHER_IMAGE_URL = "https://cdn.pixabay.com/photo/2013/01/04/11/32/toronto-73508_1280.jpg"
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q=toronto"
    let API_KEY = "15d6c45f4e069d101adf791303103bf5"
    
    // MARK: Properties
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    var currentWeather = [Double]()
    let currentWeatherTitle = ["Temperature", "Pressure", "Humidity"]
    let currentWeatherUnit = ["K", "hPa", "%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = URL(string: WEATHER_IMAGE_URL)!
        
        let imageData = NSData(contentsOf: imageURL)!
        
        let image = UIImage(data: imageData as Data)
        self.imageView.image = image
        
        weatherTable.delegate = self
        weatherTable.dataSource = self

        let weatherUrl = URL(string: (WEATHER_URL + "&APPID=\(API_KEY)"))!

        var request = URLRequest(url: weatherUrl)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            // main thread
            // when using insecure domain, have to update info.plist -> app transport security settings
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                
                if (statusCode == 200) {
                    // parse the data here
                    // ! after data is to unwrap the data
                    self.parseJson(with:data!)
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private
    func parseJson(with data: Data) {
        // takes json and creates a dictionary of objects
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            
            // update table with new data
            if let mainResults = jsonDict?["main"] as? NSDictionary {
                
                let temp = mainResults["temp"] as! Double
                let pressure = mainResults["pressure"] as! Double
                let humidity = mainResults["humidity"] as! Double
                
                currentWeather += [temp, pressure, humidity]
                
                DispatchQueue.main.async {
                    self.weatherTable.reloadData()
                }

            }
        } catch {
            print("JSON parsing failed")
        }
    }
}

extension Step3ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = currentWeather[indexPath.row]
        let title = currentWeatherTitle[indexPath.row]
        let unit = currentWeatherUnit[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ElementCell")
        
        cell.textLabel?.text = "\(title): \(data) \(unit)"
        
        return cell
    }
}
