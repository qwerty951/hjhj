//
//  ImageTableViewCell.swift
//  cell1
//
//  Created by admin on 26.09.2023.
//

import Foundation
import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    var imageURL: URL?
    var dataTask: URLSessionDataTask?
    
    
    func loadImage(url: URL) {
        imageView?.image = nil
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.imageView?.image = image
                    print("LoadImage url:\(url)")
                    print("image:\(image)")
                }
            }
        }
        dataTask?.resume()
    }
}
