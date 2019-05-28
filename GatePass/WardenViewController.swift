//
//  WardenViewController.swift
//  GatePass
//
//  Created by A.S.D.Vinay on 15/04/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit
import CoreData

class WardenViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    private let cellId = "cellId"
    var username = String()
    var passes = [Passes]()
    
    let gradientLayer = CAGradientLayer()
    let refresher = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        collectionView?.alwaysBounceVertical = true
        refresher.tintColor = UIColor.blue
        refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        refresher.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.addSubview(refresher)
        
        collectionView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-210-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":refresher]))
        collectionView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-120-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":refresher]))
        
        gradientLayer.frame =  self.view.bounds
        gradientLayer.colors = [UIColor.init(red: 245/255, green: 0, blue: 87/255, alpha: 1).cgColor,UIColor.init(red: 156/255, green: 39/255, blue: 176/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        let bgView = UIView()
        
        collectionView?.backgroundView = bgView
        
        collectionView?.backgroundView?.layer.insertSublayer(gradientLayer, at: 0)
        collectionView?.showsVerticalScrollIndicator = false
        
        let titleView:UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let titleLabel:UILabel = {
            let textView = UILabel()
            textView.text = username
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            return textView
            
        }()

        
        let logoutButton:UIButton = {
            let textView = UIButton()
            textView.tintColor = UIColor.white
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.addTarget(self, action: #selector(logout), for: .touchUpInside)
            return textView
            
        }()
        
        let img2:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_exit_to_app_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            return imgV
        }()
        
        

        
        logoutButton.addSubview(img2)
        
        logoutButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img2]))
        logoutButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img2]))
        
        titleView.addSubview(titleLabel)
        
        titleView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        titleView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        
        
        
        self.view.addSubview(titleView)

        self.view.addSubview(logoutButton)
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-[v2(50)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleView,"v2":logoutButton]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoutButton]))
        
        
        let fetchRequest:NSFetchRequest<Passes> = Passes.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
            for pass in searchResults as [Passes]{
                if(pass.p_request == true && pass.w_request == false){
                var check = false;
                
                let newDate = Date()
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateStyle = DateFormatter.Style.medium
                
                dateFormatter.timeStyle = DateFormatter.Style.short
                
                
                let calendar = NSCalendar.current
                let  d1 = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond],from:dateFormatter.date(from: String(pass.to_date!+", "+pass.to_time!))!)
                
                
                
                let d2 = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond],from:newDate as Date)
                
                
                
                
                if(d2.year!<d1.year!) {
                    check = true
                }else if(d2.year!==d1.year!) {
                    if(d2.month!<d1.month!) {
                        check = true
                    }else if(d2.month!==d1.month!) {
                        if(d2.day!<d1.day!) {
                            check = true
                        }else if(d2.day!==d1.day!) {
                            
                            if(d2.hour!<d1.hour!){
                                check =  true;
                            }
                            else if(d2.hour!==d1.hour!){
                                if(d2.minute!<=d1.minute!){
                                    check = true;
                                }else{
                                    check = false;
                                }
                            }
                            else{
                                check =  false;
                            }
                        }else{
                            check = false;
                        }
                    }else{
                        check = false;
                    }
                }else{
                    check = false;
                }
                
                if(check){
                    passes.append(pass)
                }
            }
            }
        }
        catch{
            print("Error \(error)")
        }
        
        
        collectionView?.register(WardenPassCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pass: WardenPassCell
        pass = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WardenPassCell
        pass.pass = passes[indexPath.item]
        pass.acceptButton.tag = Int((pass.pass?.id)!)
        pass.acceptButton.addTarget(self, action: #selector(acceptAction), for: .touchUpInside)
        pass.declineButton.tag = Int((pass.pass?.id)!)
        pass.declineButton.addTarget(self, action: #selector(declineAction), for: .touchUpInside)
        return pass
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = passes.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-40, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(90, 20, 10, 20)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func logout(){
        let vc = ViewController()
        present(vc, animated: true, completion: {
        })
    }
    
    func form(){
        let vc = FormViewController()
        vc.username = username
        present(vc, animated: true, completion: {
        })
    }
    
    @objc func loadData()
    {
        passes.removeAll()
        let fetchRequest:NSFetchRequest<Passes> = Passes.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
            for pass in searchResults as [Passes]{
                if(pass.p_request == true && pass.w_request == false){
                var check = false;
                
                let newDate = Date()
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateStyle = DateFormatter.Style.medium
                
                dateFormatter.timeStyle = DateFormatter.Style.short
                
                
                let calendar = NSCalendar.current
                let  d1 = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond],from:dateFormatter.date(from: String(pass.to_date!+", "+pass.to_time!))!)
                
                
                
                let d2 = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond],from:newDate as Date)
                
                
                
                
                if(d2.year!<d1.year!) {
                    check = true
                }else if(d2.year!==d1.year!) {
                    if(d2.month!<d1.month!) {
                        check = true
                    }else if(d2.month!==d1.month!) {
                        if(d2.day!<d1.day!) {
                            check = true
                        }else if(d2.day!==d1.day!) {
                            
                            if(d2.hour!<d1.hour!){
                                check =  true;
                            }
                            else if(d2.hour!==d1.hour!){
                                if(d2.minute!<=d1.minute!){
                                    check = true;
                                }else{
                                    check = false;
                                }
                            }
                            else{
                                check =  false;
                            }
                        }else{
                            check = false;
                        }
                    }else{
                        check = false;
                    }
                }else{
                    check = false;
                }
                
                if(check){
                    passes.append(pass)
                    }
                }
            }
        }
        catch{
            print("Error \(error)")
        }
        
        refresher.endRefreshing()
        collectionView?.reloadData()
    }
    
    @objc func acceptAction(sender:UIButton){
        let fetchRequest:NSFetchRequest<Passes> = Passes.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
            for pass in searchResults as [Passes]{
                if(pass.p_request == true && pass.w_request == false && pass.id == Int16(sender.tag)){
                    pass.w_request = true
                    DatabaseController.saveContext()
                }
            }
        }
        catch{
            print("Error \(error)")
        }
        
    }
    @objc func declineAction(sender:UIButton){
        let fetchRequest:NSFetchRequest<Passes> = Passes.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
            for pass in searchResults as [Passes]{
                if(pass.p_request == true && pass.w_request == false && pass.id == Int16(sender.tag)){
                    DatabaseController.persistentContainer.viewContext.delete(pass)
                    DatabaseController.saveContext()
                }
            }
        }
        catch{
            print("Error \(error)")
        }
    }

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

}
