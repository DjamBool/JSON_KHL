//
//  TeamCell.swift
//  JSON_KHL
//
//  Created by Игорь Мунгалов on 13.10.2022.
//

import UIKit

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLocation: UILabel!
    @IBOutlet weak var teamConference: UILabel!
 
    func configure(with team: Team) {
        teamName.text = team.team.name
        teamLocation.text = team.team.location
        teamConference.text = team.team.conference
        
        DispatchQueue.global().async {
            guard let image = team.team.image else { return }
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.teamImage.image = UIImage(data: imageData)
            }
        }
    }
}


