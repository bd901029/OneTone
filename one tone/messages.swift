//
//  messages.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class messages: AnimationPresent ,UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
   let names = ["Elisa","Elisa","Elisa","Elisa","Elisa","Elisa","Elisa","Elisa","Elisa","Elisa"]
    let image = ["Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png","Girl-PNG.png",]
    let time = ["4h","10d","2m","4h","10d","2m","4h","10d","2m","54d"]
    let message = ["Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting ","Lorem Ipsum is simply dummy text of the printing and typesetting "]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.allowsSelection = true
        self.hideKeyboardWhenTappedAround()
    
        // Do any additional setup after loading the view.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "message") as! message
        
        cell.name.text = self.names[indexPath.row]
        cell.time.text = self.time[indexPath.row]
        cell.personImage.image = UIImage(named: image[indexPath.row])
        cell.message.text = self.message[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
         self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "chat")
    }

}
