//
//  MainViewController.swift
//  JSON_KHL
//
//  Created by Игорь Мунгалов on 13.10.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    let jsonUrl = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    var teams = [Team]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return teams.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TeamCell
        let team = teams[indexPath.row]
        cell.configure(with: team)

        return cell
    }
    

    private func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                self.teams = try JSONDecoder().decode([Team].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        } .resume()
    }

}
