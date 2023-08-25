//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Faki Doosuur Doris on 23.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    
    var selectedImage: String?
    
    var selectedPictureNumber = 0
    var totalNumberOfPictures = 0
    
    override func viewDidLoad() {
        
       // navigationItem.largeTitleDisplayMode = .never
        
        title = selectedImage
        
        super.viewDidLoad()
        
        title = "Picture \(selectedPictureNumber) of \(totalNumberOfPictures)"
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            ImageView.image  = UIImage(named: imageToLoad)
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
