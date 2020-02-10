//
//  pastCallsVc.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class pastCallsVc: AnimationPresent , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    let name = ["Alexa","Alexa","Alexa"]
    let place = ["Barcelona, Spain","London, England","Ankara, Turkey"]
    let pepoleImage = ["Girl-PNG.png","Girl-PNG.png","Girl-PNG.png"]
    let status = ["greenDot.png","","greenDot.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "pastCallsVcCell") as! pastCallsVcCell
        cell.person.image = UIImage(named: pepoleImage[indexPath.row])
        cell.name.text = self.name[indexPath.row]
        cell.place.text = self.place[indexPath.row]
        cell.status.image = UIImage(named: status[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "viewAllProfile")
        
    }
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
