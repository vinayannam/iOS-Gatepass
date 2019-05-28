//
//  PassCell.swift
//  GatePass
//
//  Created by A.S.D.Vinay on 16/04/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit

class PassCell: UICollectionViewCell{
    var pass: Passes? {
        didSet {
            if let reason = pass?.reason{
                reasonLabel.text = reason
            }
            if let fromDate = pass?.from_date,let fromTime = pass?.from_time{
                fromLabel.text = ("From:   ")+fromDate+(" ")+fromTime
            }
            if let toDate = pass?.to_date,let toTime = pass?.to_time{
                toLabel.text = ("To:        ")+toDate+(" ")+toTime
            }
            if(pass?.p_request == true && pass?.w_request == false){
                stateView.backgroundColor = UIColor.orange
            }else if(pass?.p_request == true && pass?.w_request == true){
                stateView.backgroundColor = UIColor.green
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let reasonLabel:UILabel = {
    let textView = UILabel()
    textView.tintColor = UIColor.white
    textView.textColor = UIColor.white
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
    }()
    
    
    let fromLabel:UILabel = {
    let textView = UILabel()
    textView.tintColor = UIColor.white
    textView.textColor = UIColor.white
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
    }()
    
    let toLabel:UILabel = {
        let textView = UILabel()
        textView.tintColor = UIColor.white
        textView.textColor = UIColor.white
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    let img1:UIImageView = {
        let imgV = UIImageView()
        imgV.image = #imageLiteral(resourceName: "ic_directions_car_3x")
        imgV.contentMode = .scaleAspectFit
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.isUserInteractionEnabled = false
        return imgV
    }()
    
    
    let stateView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()



    
    
    func setupViews(){
        layer.cornerRadius = 10
        backgroundColor = UIColor.init(red: 216/255, green: 27/255, blue: 96/255, alpha: 1)
        
        reasonLabel.addSubview(img1)
        reasonLabel.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]-(-10)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img1]))
        reasonLabel.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":img1]))
        
        addSubview(reasonLabel)
        addSubview(fromLabel)
        addSubview(toLabel)
        addSubview(stateView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":reasonLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fromLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":toLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":stateView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)]-15-[v1]-25-[v2]-25-[v3(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":reasonLabel,"v1":fromLabel,"v2":toLabel,"v3":stateView]))
    }

}

