//
//  country.swift
//  one tone
//
//  Created by Love on 22/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
class country: AnimationPresent , UITableViewDelegate , UITableViewDataSource {

    let countryNames = ["TURKEY (free)","UNITED STATES","FRANCE","UNITED KINGDOM","KOREA","JAPAN","GERMANY","SINGAPURE","BELGIUM"]
    let countryImages = ["turkeyy.png","unitedStatess.png","francee.png","unitedkingdomm.png","koreaa.png","japann.png","germanny.png","singapuree.png","belgiumm.png"]
    var check = [false,false,false,false,false,false,false,false,false]
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.allowsSelection = true
        
        
    }
    @objc func imageChange(sender: UIButton){
        let index : Int = (sender.layer.value(forKey: "index") as! Int)
        for i in 0..<check.count {
            if i == index{
                check[i] = true
            }
            else{
                check[i] = false
            }
        }
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! countryCell
        
        cell.countryImage.image = UIImage(named: countryImages[indexPath.row])
        cell.countryName.text = self.countryNames[indexPath.row]
        
        cell.radioButton.layer.setValue(indexPath.row, forKey: "index")
        cell.radioButton.addTarget(self, action: #selector(self.imageChange), for: .touchUpInside)
        
        if check[indexPath.row] == false{
            cell.radioButton.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else{
            cell.radioButton.setImage(UIImage(named: "checked.png"), for: .normal)
        }
        
        if indexPath.row % 2 == 0
        {
            cell.viewContainingAll.backgroundColor = UIColor(red: 247.0/255.0,green: 247.0/255.0 , blue: 247.0/255.0 , alpha: 1.0)
        }
        else {
            cell.viewContainingAll.backgroundColor = UIColor(red: 255.0/255.0,green: 255.0/255.0 , blue: 255.0/255.0 , alpha: 1.0)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        for i in 0..<check.count {
            if i == index{
                check[i] = true
            }
            else{
                check[i] = false
            }
        }
        self.tableView.reloadData()
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
