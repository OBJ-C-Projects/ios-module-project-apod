//
//  DetailViewController.swift
//  Astronomy Picture of the Day
//
//  Created by FGT MAC on 6/2/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Properties
    private var fetch = FGTNetworkFetch()
    private var photo: FGTPhoto? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    //MARK: - Private Methods
    
    private func fetchData() {
        loaderView(isLoading: true)
        fetch.fetchPhotos("2020-01-02") { (data, error) in
            self.photo = data
        }
    }
    
    private func updateViews() {
        
        guard let photo = photo else { return }
        do {
            let data = try Data(contentsOf: photo.url)
            
            if photo.mediaType == "image"{
                displayPhoto(data)
            }else{
                playVideo(data)
            }
        } catch {
            print("Error during data download\(error)")
        }
    }
    
    
    private func displayPhoto(_ photoData: Data) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: photoData)
            self.loaderView(isLoading: false)
        }
    }
    
    private func playVideo(_ videoData: Data) {
        self.loaderView(isLoading: false)
    }
    
    func loaderView(isLoading: Bool) {
        DispatchQueue.main.async {
            if isLoading {
                self.loader.stopAnimating()
                self.loader.isHidden = true
            }else{
                self.loader.startAnimating()
                self.loader.isHidden = false
            }
        }
    }

}
