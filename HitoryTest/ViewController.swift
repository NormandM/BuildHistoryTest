//
//  ViewController.swift
//  HitoryTest
//
//  Created by Normand Martin on 16-04-26.
//  Copyright © 2016 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var arr: NSMutableArray = []
    var n: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if let plist = Plist(name: "HumanPrehistory") {
            arr = plist.getMutablePlistFile()!
        }
        for arrs in arr {
            let elementHistory = arrs as! [String]
                var dateElementArray = elementHistory[0].componentsSeparatedByString(": ")
                print(dateElementArray)
                dateElementArray.append("0")
                dateElementArray.append("0")
                arr[n] = dateElementArray
                print(dateElementArray)
            n = n + 1
        }
        if let plist = Plist(name: "HumanPrehistory"){
            do {
                try plist.addValuesToPlistFile(arr)
            } catch {
                print(error)
            }
            //let newArr = plist.getValuesInPlistFile()!
            //print(newArr)
        }else{
            print("unable to get plist")
        }
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

