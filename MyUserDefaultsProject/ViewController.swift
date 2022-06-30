//
//  ViewController.swift
//  MyUserDefaultsProject
//
//  Created by Zhanna Rolich on 28.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var mySwitch = UISwitch()
    var myImageView = UIImageView()
    let lightImage = UIImage(named: "light")
    let darkImage = UIImage (named: "dark")
    let myUserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mySwitch.center = self.view.center
        self.mySwitch.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
        self.view.addSubview(self.mySwitch)
        
        if let isSwitch = myUserDefaults.object(forKey: "switch"){
            mySwitch.isOn = isSwitch as! Bool
        }
        
        if mySwitch.isOn {
            print("setDark")
            setDark()
        } else {
            print("setLight")
            setLight()
        }
        
        
    }
    
    @objc func isOn (target: UISwitch) {
        if target.isOn {
            setDark()
            
            myUserDefaults.set(mySwitch.isOn, forKey: "switch")
            
        } else {
            setLight()
            
            myUserDefaults.set(mySwitch.isOn, forKey: "switch")
            
        }
        
    }
    
    func setLight() {
        myImageView.frame = CGRect(x: 50, y: 100, width: 310, height: 250)
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = lightImage
        view.addSubview(myImageView)
        view.backgroundColor = .systemGray5
    }
    
    func setDark() {
        myImageView.frame = CGRect(x: 50, y: 100, width: 310, height: 250)
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = darkImage
        view.addSubview(myImageView)
        view.backgroundColor = .purple
    }
}

