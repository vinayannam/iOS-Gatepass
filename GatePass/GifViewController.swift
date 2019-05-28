//
//  GifViewController.swift
//  GatePass
//
//  Created by A.S.D.Vinay on 18/04/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit

class GifViewController: UIViewController {
    
    var username = String()
    
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        gradientLayer.frame =  self.view.bounds
        gradientLayer.colors = [UIColor.init(red: 245/255, green: 0, blue: 87/255, alpha: 1).cgColor,UIColor.init(red: 156/255, green: 39/255, blue: 176/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.view.layer.addSublayer(gradientLayer)
        
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
        
        
        let gif:UIImageView = {
           let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            image.loadGif(name: "fire")
            return image
        }()
        

        
        logoutButton.addSubview(img2)
        
        logoutButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img2]))
        logoutButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img2]))
        
        titleView.addSubview(titleLabel)
        
        titleView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        titleView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        
        
        
        self.view.addSubview(titleView)
        self.view.addSubview(logoutButton)
        self.view.addSubview(gif)
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-[v2(50)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleView,"v2":logoutButton]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":gif]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoutButton]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":gif]))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func logout(){
        let vc = StudentViewController(collectionViewLayout:UICollectionViewFlowLayout())
        vc.username = username
        present(vc, animated: true, completion: {
        })
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
