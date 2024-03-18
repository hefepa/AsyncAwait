//
//  PhoneTableViewCell.swift
//  AsyncAwaitProject
//
//  Created by WEMA on 17/01/2024.
//

import UIKit
import SDWebImage


class PhoneTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(with data: PhoneProperties?){
        nameLabel.text = data?.title
        priceLabel.text = "\(data?.price ?? 0)" 
        if let imageURL = URL(string: data?.thumbnail ?? "None") {
            img.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
        }else {
            img.image = UIImage(named: "placeholder.png")
        }
    }
}
