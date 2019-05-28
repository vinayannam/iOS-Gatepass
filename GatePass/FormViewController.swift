//
//  FormViewController.swift
//  GatePass
//
//  Created by A.S.D.Vinay on 15/04/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit
import CoreData

class FormViewController: UIViewController,UITextFieldDelegate {
    
    let defaults = UserDefaults.standard
    
    var increment = Int()
    
    var  username = String()
    
    let gradientLayer = CAGradientLayer()
    
    var name = UITextField()
    var home = UITextField()
    var room = UITextField()
    var fromDate = UITextField()
    var fromTime = UITextField()
    var toDate = UITextField()
    var toTime = UITextField()
    var reason = UITextField()
    var phone = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isPreloaded = defaults.bool(forKey: "iload")
        if !isPreloaded {
            increment = 0
            defaults.set(true, forKey: "iload")
        }
        else{
            
            increment = defaults.integer(forKey: "increment")
        }
        

        // Do any additional setup after loading the view.
        
        gradientLayer.frame =  self.view.bounds
        gradientLayer.colors = [UIColor.init(red: 245/255, green: 0, blue: 87/255, alpha: 1).cgColor,UIColor.init(red: 156/255, green: 39/255, blue: 176/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.view.layer.addSublayer(gradientLayer)
        
        name = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Name"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        name.delegate = self
        
        let nameImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_person_outline_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        name.addSubview(nameImg)
        
        name.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameImg]))
        name.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameImg]))
        
        home = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Tower/Apartment"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        home.delegate = self
        
        let homeImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_home_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        home.addSubview(homeImg)
        
        home.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":homeImg]))
        home.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":homeImg]))
        
        room = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Room"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        room.delegate = self
        
        let roomImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_room_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        room.addSubview(roomImg)
        
        room.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":roomImg]))
        room.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":roomImg]))
        
        reason = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Reason"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        reason.delegate = self
        
        let reasonImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_directions_car_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        reason.addSubview(reasonImg)
        
        reason.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":reasonImg]))
        reason.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":reasonImg]))
        
        phone = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.placeholder = "Phone"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        phone.delegate = self
        
        let phoneImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image  = #imageLiteral(resourceName: "ic_contact_phone_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        phone.addSubview(phoneImg)
        
        phone.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneImg]))
        phone.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneImg]))
        
        fromDate = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            let datePickerView:UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = .date
            datePickerView.addTarget(self, action: #selector(datePicker), for: UIControlEvents.valueChanged)
            
            textView.inputView = datePickerView
            textView.placeholder = "From Date"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        fromDate.delegate = self
        fromDate.inputAccessoryView = toolBarFunc()
        
        let dateImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_date_range_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        fromDate.addSubview(dateImg)
        
        fromDate.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dateImg]))
        fromDate.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dateImg]))
        
        fromTime = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            let datePickerView:UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = .time
            datePickerView.addTarget(self, action: #selector(timePicker), for: UIControlEvents.valueChanged)
            
            textView.inputView = datePickerView
            textView.placeholder = "From Time"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        fromTime.delegate = self
        fromTime.inputAccessoryView = toolBarFunc()
        
        let timeImg:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_query_builder_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        fromTime.addSubview(timeImg)
        
        fromTime.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeImg]))
        fromTime.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeImg]))
        
        toDate = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            let datePickerView:UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = .date
            datePickerView.addTarget(self, action: #selector(datePickerTo), for: UIControlEvents.valueChanged)
            
            textView.inputView = datePickerView
            textView.placeholder = "To Date"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        toDate.delegate = self
        toDate.inputAccessoryView = toolBarFunc()
        
     
        let dateImg1:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_date_range_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        toDate.addSubview(dateImg1)
        
        toDate.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dateImg1]))
        toDate.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dateImg1]))
        
        toTime = {
            let textView = UITextField()
            textView.tintColor = UIColor.white
            textView.textColor = UIColor.white
            
            
            textView.backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            let datePickerView:UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = .time
            datePickerView.addTarget(self, action: #selector(timePickerTo), for: UIControlEvents.valueChanged)
            
            textView.inputView = datePickerView
            textView.placeholder = "To Time"
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.borderStyle = UITextBorderStyle.roundedRect
            textView.autocapitalizationType = UITextAutocapitalizationType.none;
            textView.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
            return textView
        }()
        
        toTime.delegate = self
        toTime.inputAccessoryView = toolBarFunc()
        
        let timeImg1:UIImageView = {
            let imgV = UIImageView()
            imgV.image = #imageLiteral(resourceName: "ic_query_builder_3x")
            imgV.contentMode = .scaleAspectFit
            imgV.translatesAutoresizingMaskIntoConstraints = false
            imgV.isUserInteractionEnabled = false
            return imgV
        }()
        
        
        
        toTime.addSubview(timeImg1)
        
        toTime.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeImg1]))
        toTime.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeImg1]))
        
        let buttonView:UIButton = {
            let button = UIButton()
            button.setTitle("Request Parent",for: .normal)
            button.backgroundColor = UIColor.init(red: 134/255, green: 42/255, blue: 148/255, alpha: 1)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            return button
        }()

        
        self.view.addSubview(name)
        self.view.addSubview(home)
        self.view.addSubview(room)
        self.view.addSubview(reason)
        self.view.addSubview(phone)
        self.view.addSubview(fromDate)
        self.view.addSubview(fromTime)
        self.view.addSubview(toDate)
        self.view.addSubview(toTime)
        self.view.addSubview(buttonView)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":name]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":home]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":room]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":reason]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phone]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fromDate]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fromTime]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":toDate]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":toTime]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":buttonView]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0(50)]-10-[v1(50)]-10-[v2(50)]-10-[v3(50)]-10-[v4(50)]-10-[v5(50)]-10-[v6(50)]-10-[v7(50)]-10-[v8(50)]-10-[v9(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":name,"v1":home,"v2":room,"v3":fromDate,"v4":fromTime,"v5":toDate,"v6":toTime,"v7":reason,"v8":phone,"v9":buttonView]))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.name.resignFirstResponder()
        self.home.resignFirstResponder()
        self.room.resignFirstResponder()
        self.reason.resignFirstResponder()
        self.phone.resignFirstResponder()
        return true
    }

    @objc func datePicker(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        

        
        fromDate.text = dateFormatter.string(from: sender.date)
        
    }
    
    @objc func timePicker(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.none
        
        dateFormatter.timeStyle = DateFormatter.Style.short

        
        fromTime.text = dateFormatter.string(from: sender.date)
        
    }
    
    @objc func datePickerTo(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        toDate.text = dateFormatter.string(from: sender.date)
        
        dateFormatter.dateStyle = DateFormatter.Style.full
        
        dateFormatter.timeStyle = DateFormatter.Style.full
        
        
        

        
    }
    
    @objc func timePickerTo(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.none
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        toTime.text = dateFormatter.string(from: sender.date)
        
    }
    
    func toolBarFunc()->UIToolbar{
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40.0))
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        

        
        let okBarBtn = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePressed))
        
        
        toolBar.setItems([okBarBtn], animated: true)
        return toolBar
    }
    
    @objc func donePressed() {
        
        fromDate.resignFirstResponder()
        fromTime.resignFirstResponder()
        toTime.resignFirstResponder()
        toDate.resignFirstResponder()
        
    }
    
    @objc func buttonAction(){
        
        if(name.text == "" || home.text == "" || room.text == "" || fromDate.text == "" || fromTime.text == "" || toDate.text == "" || toTime.text == "" || reason.text == "" || phone.text == ""){
            self.alert(message: "Please fill all the fields.")
        }else if(dateTimeCheck(date: toDate.text!, time: toTime.text!)){
            let newPass:Passes = NSEntityDescription.insertNewObject(forEntityName: "Passes", into: DatabaseController.persistentContainer.viewContext) as! Passes
            newPass.id = Int16(increment)
            newPass.username = username
            newPass.name = name.text
            newPass.home = home.text
            newPass.room = room.text
            newPass.from_date = fromDate.text
            newPass.from_time = fromTime.text
            newPass.to_date = toDate.text
            newPass.to_time = toTime.text
            newPass.reason = reason.text
            newPass.phone = phone.text
            newPass.s_request = true
            newPass.p_request = false
            newPass.w_request = false
            newPass.checkDate = toDate.text!+", "+toTime.text!
            DatabaseController.saveContext()
            increment = increment+1
            defaults.set(increment, forKey: "increment")
        let layout = UICollectionViewFlowLayout()
        let vc = StudentViewController(collectionViewLayout:layout)
        vc.username = username
        present(vc, animated: true, completion: {
        })
        }
        else{
            self.alert(message: "Please insert valid time.")
        }
    }
    
    func dateTimeCheck(date:String,time:String)->Bool{
        
        let newDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        
        let calendar = NSCalendar.current
        let  d1 = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond],from:dateFormatter.date(from: String(toDate.text!+", "+toTime.text!))!)
        

        
         let d2 = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond],from:newDate as Date)
        

        
        
        if(d2.year!<d1.year!) {
            return true;
        }else if(d2.year!==d1.year!) {
            if(d2.month!<d1.month!) {
                return true;
            }else if(d2.month!==d1.month!) {
                if(d2.day!<d1.day!) {
                    return true;
                }else if(d2.day!==d1.day!) {
                    
                    if(d2.hour!<d1.hour!){
                        return true;
                    }
                    else if(d2.hour!==d1.hour!){
                        if(d2.minute!<=d1.minute!){
                            return true;
                        }else{
                            return false;
                        }
                    }
                    else{
                        return false;
                    }
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }else{
            return false;
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
