




import UIKit


class BaseCollectionViewCell: UICollectionViewCell ,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let name = ["Alexa","Alexa","Alexa"]
    let place = ["Barcelona, Spain","London, England","Ankara, Turkey"]
    let pepoleImage = ["63537719.png","63537719.png","63537719.png"]
    let status = ["online.png","","online.png"]
    
    override func awakeFromNib() {
        
      self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "baseKitableViewCell", bundle: nil), forCellReuseIdentifier: "baseKitableViewCell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false

      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "baseKitableViewCell", for: indexPath) as! baseKitableViewCell
        cell.message.text = self.place[indexPath.row]
        cell.name.text = self.name[indexPath.row]
        cell.personImage.image = UIImage(named: pepoleImage[indexPath.row])
        cell.status.image = UIImage(named: status[indexPath.row])
        
        return cell
        

        
    }
     
   }

