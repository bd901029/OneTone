//
//  chat.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class chat: AnimationPresent,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
   
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var sendObj: UIButton!
    
    @IBOutlet weak var chatCollectionView: UICollectionView!
    
    @IBOutlet weak var chatTitle: UINavigationItem!
    
    
    private let cellId = "cellId"
    
    var message = [ChatDataBase]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendObj.setImage(UIImage.init(named: "sent.png")?.imageWithColor(color: hexStringToUIColor(hex: "#37F0B0")), for: .normal)
        
        chatCollectionView?.register(ChatlogCell.self, forCellWithReuseIdentifier: cellId)
        
        chatCollectionView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        
        self.deleteDatabase()
        
    }
    
    
    func deleteDatabase(){
        
        
        
        let chatDatabase = RecentDatabase.shared.queryAllProduct()
        
        for i in 0..<chatDatabase.count{
            
            let deleteProduct = RecentDatabase.shared.deleteProduct(inputId: chatDatabase[i].user_id)
            
            print(deleteProduct)
            
            
        }
        
        self.ChatMessageNot()
    }
    
   
    
    func ChatMessageNot(){
        
        self.message.removeAll()
        
        
        if let comeMessage = RecentDatabase.shared.addProduct(inputuser_id: "2", inputdriver_id: "1", inputmessage: "Hello how are you!!", inputbooking_id: "", inputtype: "another"){
            
            print(comeMessage)
            
        }
        
        let chatDatabase = RecentDatabase.shared.queryAllProduct()
        
        for i in 0..<chatDatabase.count{
            
            
            let object = ChatDataBase(user_id: chatDatabase[i].user_id, driver_id: chatDatabase[i].driver_id, message: chatDatabase[i].message, booking_id: chatDatabase[i].booking_id, type: chatDatabase[i].type)
            
            self.message.append(object)
          
        }
        
        
        self.message.reverse()
        self.chatCollectionView.reloadData()
        
        if self.message.count != 0{
            
            let lastItemIndex = IndexPath(item: 0, section: 0)
            
            self.chatCollectionView.scrollToItem(at: lastItemIndex, at: UICollectionViewScrollPosition.top, animated: true)
            
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        messageTextfield.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.message.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatlogCell
        
        
        cell.transform = collectionView.transform
        
        cell.messageTextView.text = message[indexPath.row].message
        
        let messageText = message[indexPath.row].message
        
        cell.profileImageView.image = UIImage(named:"robert.jpg")
        
        
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18)], context: nil)
        
        
        if message[indexPath.row].type == "user"{
            
            
            cell.messageTextView.frame = CGRect(x: view.frame.width - estimatedFrame.width - 16 - 16 - 8 , y: 0, width: estimatedFrame.width + 16, height: estimatedFrame.height+20)
            cell.textBubbleView.frame = CGRect(x: view.frame.width-estimatedFrame.width - 16 - 8 - 16 - 10, y: -4, width: estimatedFrame.width + 16 + 8 + 10, height: estimatedFrame.height+20+6)
            cell.profileImageView.isHidden = true
            cell.bubbleImageView.image = ChatlogCell.blueBubbleImage
            cell.bubbleImageView.tintColor = hexStringToUIColor(hex: "#37F0B0")
            cell.messageTextView.textColor = UIColor.white
            
            
        }
        else if message[indexPath.row].type == "another"{
            
            
            cell.messageTextView.frame = CGRect(x: 48+8, y: 0, width: estimatedFrame.width + 16, height: estimatedFrame.height+20)
            cell.textBubbleView.frame = CGRect(x: 48 - 10, y: -4, width: estimatedFrame.width + 16 + 8 + 16, height: estimatedFrame.height+20+6)
            cell.profileImageView.isHidden = false
            cell.bubbleImageView.image = ChatlogCell.grayBubbleImage
            cell.bubbleImageView.tintColor = UIColor(white: 0.95, alpha: 1)
            cell.messageTextView.textColor = UIColor.black
        }
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
            
            let message = self.message[indexPath.row].message
            let messageText = message
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18)], context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height+20)
       
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(8, 0, 0, 0)
    }
    

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendAct(_ sender: Any) {
        
        if self.messageTextfield.text == ""{
            
            print("noooo")
            
        }else{
            
            
            if let sendMessage = RecentDatabase.shared.addProduct(inputuser_id: "1", inputdriver_id: "2", inputmessage: "\(self.messageTextfield.text!)", inputbooking_id: "", inputtype: "user"){
                
                
                
                print(sendMessage)
                
                
                
                self.messageTextfield.text = ""
                self.ChatMessageNot()
                
                
                
                
            }
            
        }
    }
    
    @IBAction func plusAct(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let view = UIView(frame: CGRect(x: 8.0, y: 8.0, width: actionSheet.view.bounds.size.width - 8.0 * 4.5, height: 100.0))
        view.backgroundColor = UIColor.clear
        actionSheet.view.addSubview(view)
        
        actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: {(alert) in
            
            print("ok")
            
        }))
            
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(alert) in
            
            print("ok")
            
        }))
            
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
        present(actionSheet, animated: true, completion: nil)
        
    }
   
}
class ChatlogCell:BaseCell{
    
    
    
    static let grayBubbleImage = UIImage(named:"bubble_gray")?.resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
    static let blueBubbleImage = UIImage(named:"bubble_blue")?.resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
    
    
    let messageTextView : UITextView = {
        let textView = UITextView()
        textView.text = "Sample Message"
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = UIColor.clear
        textView.isEditable = false
        return textView
    }()
    
    
    
    let textBubbleView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let profileImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        iv.layer.borderWidth = 2.0
        iv.layer.borderColor = UIColor.black.cgColor
        return iv
        
    }()
    
    let bubbleImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = ChatlogCell.grayBubbleImage
        iv.tintColor = UIColor(white: 0.90, alpha: 1)
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(textBubbleView)
        addSubview(messageTextView)
        addSubview(profileImageView)
        
        
        addConstraintsWithFormat(format: "H:|-8-[v0(30)]|", views: profileImageView)
        addConstraintsWithFormat(format: "V:[v0(30)]|", views: profileImageView)
        
        
        textBubbleView.addSubview(bubbleImageView)
        textBubbleView.addConstraintsWithFormat(format: "H:|[v0]|", views: bubbleImageView)
        textBubbleView.addConstraintsWithFormat(format: "V:|[v0]|", views: bubbleImageView)
        
        
        
        
    }
    
}


