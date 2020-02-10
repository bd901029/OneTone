//
//  Friends.swift
//  one tone
//
//  Created by Love on 24/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class Friends: AnimationPresent , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pastCallsCollectionView: UICollectionView!
   
    @IBOutlet weak var menuCollection: UICollectionView!
    
    @IBOutlet weak var downCollection: UICollectionView!
    
    @IBOutlet weak var menu_View: UIView!
    
    
    
    var xPos:CGFloat = 0
    let horizontalBarView = UIView()
    
    var menuAray = ["Friend List","Requests"]
    
    let image = ["63537719.png","63537719.png","63537719.png","63537719.png","63537719.png","63537719.png","63537719.png","63537719.png","63537719.png","63537719.png",]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "pastCalls", bundle: nil)
        pastCallsCollectionView.register(nib, forCellWithReuseIdentifier: "pastCalls")
        
        
        self.pastCallsCollectionView.delegate = self
        self.pastCallsCollectionView.dataSource = self
        self.menuCollection.delegate = self
        self.menuCollection.dataSource = self
        self.downCollection.delegate = self
        self.downCollection.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
        
        downCollection.isPagingEnabled = true
        
        
        setupHorizontalBar()
     
    }

   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pastCallsCollectionView{
            return self.image.count

        }
        else{
            return 2
        }
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == pastCallsCollectionView{
            let cell = pastCallsCollectionView.dequeueReusableCell(withReuseIdentifier: "pastCalls", for: indexPath) as! pastCalls
            cell.person.image = UIImage(named: image[indexPath.row])
            cell.person.layer.masksToBounds = true
            cell.person.layer.cornerRadius = cell.person.frame.height / 2
            return cell
            
        }
        else if collectionView == menuCollection
            {
                let nib = UINib(nibName: "MenuCell", bundle: nil)
                collectionView.register(nib, forCellWithReuseIdentifier: "MenuCollectionViewCell")
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
                if indexPath.row == 0{
                    cell.labelIcon.isHidden = true

                }
                else{
                    cell.labelIcon.isHidden = false
                }
                cell.cell_Label.text = menuAray[indexPath.row]
                
                return cell
                
            }else{
                
                if indexPath.row == 0{
                    
                    let nib = UINib(nibName: "BaseCell", bundle: nil)
                    collectionView.register(nib, forCellWithReuseIdentifier: "BaseCollectionViewCell")
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCollectionViewCell", for: indexPath) as! BaseCollectionViewCell
                    return cell
                    
                    
                }else{
                    
                    let nib = UINib(nibName: "ScheduleCollectionViewCell", bundle: nil)
                    collectionView.register(nib, forCellWithReuseIdentifier: "ScheduleCollectionViewCell")
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleCollectionViewCell", for: indexPath) as! ScheduleCollectionViewCell
                    return cell
                    
                    
                    
                    
                
                
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pastCallsCollectionView{
            return CGSize(width: 60.0, height: 60.0)

        }
        else if collectionView == menuCollection {
            return CGSize(width: self.menuCollection.frame.width / 2, height: self.menuCollection.frame.height)
        }else{
            
            return CGSize(width: self.downCollection.frame.width, height: self.downCollection.frame.height)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    @IBAction func viewAll(_ sender: UIButton) {
      
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "pastCallsVc")

    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == menuCollection {
            
            
            scrollToMenuIndex(indexPath.item)
            
        }
        
    }
    
    func setupHorizontalBar() {
        
        horizontalBarView.backgroundColor = UIColor(red: 74.0/255, green: 139.0/255, blue: 253.0/255,alpha: 1.0)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalBarView.frame = CGRect(x: xPos, y: 50, width: UIScreen.main.bounds.size.width/2, height: 1)
        
        
        self.menu_View.addSubview(horizontalBarView)
        
    }
    
    func scrollToMenuIndex(_ menuIndex: Int) {
        
        
        
        let indexPath = IndexPath(item: menuIndex, section: 0)
        downCollection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
        
        if indexPath.item == 0{
            
//            NotificationCenter.default.post(name: NSNotification.Name("BookingCall"), object: nil)
            
            
        }else{
            
            
//            NotificationCenter.default.post(name: NSNotification.Name("ScheduleCall"), object: nil)
            
        }
   
    }
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            
            
            
            let index = targetContentOffset.pointee.x / view.frame.width
            
            
            
            
            let indexPath = IndexPath(item: Int(index), section: 0)
            self.menuCollection.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
            
            
            if indexPath.item == 0{
                
//                NotificationCenter.default.post(name: NSNotification.Name("BookingCall"), object: nil)
                
                
            }else{
                
                
//                NotificationCenter.default.post(name: NSNotification.Name("ScheduleCall"), object: nil)
                
            }
            
            
        }
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == menuCollection || scrollView == downCollection{
            
        
            
        xPos = scrollView.contentOffset.x / 2
        self.horizontalBarView.removeFromSuperview()
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.menuCollection.frame = self.menu_View.frame
            self.setupHorizontalBar()
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        }
        
    }
    
        
    
}
    
    

