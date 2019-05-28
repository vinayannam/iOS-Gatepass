//
//  ViewController.swift
//  GatePass
//
//  Created by A.S.D.Vinay on 12/04/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate{
    
    let gradientLayer = CAGradientLayer()
    
    var editText1 = UITextField()
    var editText2 = UITextField()



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        gradientLayer.frame =  self.view.bounds
        gradientLayer.colors = [UIColor.init(red: 245/255, green: 0, blue: 87/255, alpha: 1).cgColor,UIColor.init(red: 156/255, green: 39/255, blue: 176/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.view.layer.addSublayer(gradientLayer)
        
        let logoView1:UIImageView = {
            let logoView = UIImageView()
            logoView.image = #imageLiteral(resourceName: "bml")
            logoView.contentMode = .scaleAspectFit
            logoView.tintColor = UIColor.white
            logoView.translatesAutoresizingMaskIntoConstraints = false
            return logoView
        }()
        
        let logoView2:UIImageView = {
            let logoView = UIImageView()
            logoView.image = #imageLiteral(resourceName: "gp2")
            logoView.contentMode = .scaleAspectFit
            logoView.tintColor = UIColor.white
            logoView.translatesAutoresizingMaskIntoConstraints = false
            return logoView
        }()
        
            editText1 = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Username"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        editText1.delegate = self
        
            editText2 = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
        
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Password"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.isSecureTextEntry = true
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()

        
        editText2.delegate = self
        
        let buttonView:UIButton = {
            let button = UIButton()
            button.setTitle("LOG IN",for: .normal)
            button.backgroundColor = UIColor.init(red: 134/255, green: 42/255, blue: 148/255, alpha: 1)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            return button
        }()
    
        let img1:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_person_outline_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        let img2:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_lock_outline_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        editText1.addSubview(img1)
        editText2.addSubview(img2)
        
        editText1.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img1]))
        editText1.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img1]))
        
        editText2.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img2]))
        editText2.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img2]))


        self.view.addSubview(logoView1)
        self.view.addSubview(logoView2)
        self.view.addSubview(editText1)
        self.view.addSubview(editText2)
        self.view.addSubview(buttonView)

        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoView1]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoView1]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoView2]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-210-[v0(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoView2]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":editText1]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-340-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":editText1]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":editText2]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-400-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":editText2]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":buttonView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-480-[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":buttonView]))
       
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.editText2.resignFirstResponder()
        self.editText1.resignFirstResponder()
        return true
    }
   
    
    @objc func buttonAction(){
        var username = String()
        var student = String()
        var sCheck = false
        var pCheck = false
        var wCheck = false
        if(editText1.text == "" || editText2.text == ""){
            self.alert(message: "Please fill")
        }else{
            for student in DatabaseController.studentsDefault{
                if(student.username! == editText1.text! && student.password! == editText2.text!){
                    username = editText1.text!
                    sCheck = true
                    break
                }
            }
            for parent in DatabaseController.parentsDefault{
                if(parent.username! == editText1.text! && parent.password! == editText2.text!){
                    username = editText1.text!
                    student = parent.studentuser!
                    pCheck = true
                    break
                }
            }
            for warden in DatabaseController.wardenDefault{
                if(warden.username! == editText1.text! && warden.password! == editText2.text!){
                    username = editText1.text!
                    wCheck = true
                    break
                }
            }

            if(sCheck){
                
                let vc = StudentViewController(collectionViewLayout:UICollectionViewFlowLayout())
                vc.username = username
                present(vc, animated: true, completion: {
                })
            }
            else{
                if(pCheck){
                    let vc = ParentViewController(collectionViewLayout:UICollectionViewFlowLayout())
                    vc.username = username
                    vc.student = student
                    present(vc, animated: true, completion: {
                    })
                }
                else{
                    if(wCheck){
                        let vc = WardenViewController(collectionViewLayout:UICollectionViewFlowLayout())
                        vc.username = username
                        present(vc, animated: true, completion: {
                        })
                    }
                    else{
                        self.alert(message: "Enter correct username and Password")
                    }
                }
            }
        }
        
        

    }



    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

