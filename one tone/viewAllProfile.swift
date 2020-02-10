//
//  viewAllProfile.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class viewAllProfile: AnimationPresent , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    

    @IBOutlet weak var request: UIButton!
    @IBOutlet weak var message: UIButton!
    @IBOutlet weak var collectionViewInstagram: UICollectionView!
    
      let image = ["65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg","65b840191f62a53b17700a7d0153aac0--gorgeous-women-beautiful-people.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        
        self.collectionViewInstagram.delegate = self
        self.collectionViewInstagram.dataSource = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nib = UINib(nibName: "instagramPhotoCell", bundle: nil)
        
        collectionViewInstagram.register(nib, forCellWithReuseIdentifier: "instagramPhotoCell")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "instagramPhotoCell", for: indexPath) as! instagramPhotoCell
        cell.image.image = UIImage(named: image[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: 70.0, height: 80.0)
            
        }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addFriend(_ sender: UIButton) {
        request.setImage(UIImage(named: "friendadded.png"), for: .normal)
    }
    
    @IBAction func ThreeDots(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let view = UIView(frame: CGRect(x: 8.0, y: 8.0, width: actionSheet.view.bounds.size.width - 8.0 * 4.5, height: 100.0))
        view.backgroundColor = UIColor.clear
        actionSheet.view.addSubview(view)
        actionSheet.addAction(UIAlertAction(title: "Person Block", style: .default, handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
}
