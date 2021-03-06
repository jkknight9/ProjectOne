//
//  PictureViewController.swift
//  ProjectOne
//
//  Created by Jack Knight on 5/4/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {


    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture: \(selectedPictureNumber) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        print(imageToLoad)
        }
        
    
    }
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1.0) else {
            print("No image found")
            return
        }
        if let imageSelected = selectedImage {
            imageView.image = UIImage(named: imageSelected)
        
        let vc = UIActivityViewController(activityItems: [image, imageSelected], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
