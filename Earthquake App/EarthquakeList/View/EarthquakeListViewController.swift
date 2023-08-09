//
//  ViewController.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import UIKit

class EarthquakeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var earthquakeList: [Result] = []
    var presenter: ViewToPresenterEarthquakeListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EarthquakeListRouter.createModule(ref: self)
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter?.load()
    }
    
    
}

extension EarthquakeListViewController: PresenterToViewEarthquakeListProtocol {
    func sendDataToView(_ earthquake: Earthquake) {
        DispatchQueue.main.async {
            self.earthquakeList = earthquake.result
            self.tableView.reloadData()
        }
    }
    
    func isLoading(_ isLoading: Bool) {
        if isLoading {
            tableView.isHidden = true
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
            tableView.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let earthquake = earthquakeList[indexPath!.row]
        if segue.identifier == "toDetail" {
            if let earthquakeLocationVC = segue.destination as? EarthquakeLocationViewController {
                earthquakeLocationVC.coordinates = earthquake.geojson.coordinates
                earthquakeLocationVC.locationName = earthquake.title
            }
        }
    }
    
}


extension EarthquakeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let earthquake = earthquakeList[indexPath.row]
        let formattedDate = DateFormatterHelper.formatDate(earthquake.date)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EarthquakeListTableViewCell
        cell.nameLabel.text = earthquake.title
        cell.dateLabel.text = formattedDate
        cell.magLabel.text = String(earthquake.mag)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
}

