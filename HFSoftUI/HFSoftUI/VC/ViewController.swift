//
//  ViewController.swift
//  HFSoftUI
//
//  Created by Hamza on 29/01/2020.
//  Copyright © 2020 Hamza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var sideMenuButtonOutlet: UIButton!
    @IBOutlet weak var goToNextVCOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetup()
        
        makeStackViewSoft()
        
    }
    
    func doInitialSetup() {
        
        self.outerView.backgroundColor = HFSoftUIColor
        
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = HFSoftUIColor
            
        self.sideMenuButtonOutlet.HFSoftUIButton(backgroundColorValue: HFSoftUIColor, isDarkColorScheme: isDarkColorScheme, isUpperWhiteRequired: isUpperWhiteRequired)
        
        self.goToNextVCOutlet.HFSoftUIButton(backgroundColorValue: HFSoftUIColor, cornerRadiusValue: self.goToNextVCOutlet.frame.height / 2, isDarkColorScheme: isDarkColorScheme, isUpperWhiteRequired: isUpperWhiteRequired)
        
    }
    
    func makeStackViewSoft() {
        
        for (index, item) in stackView.arrangedSubviews.enumerated() {
            
            let button = item.viewWithTag(index) as? UIButton
            
            if button?.tag == 0 {
                
                button?.HFSoftUIButton(shadowRadiusValue: -2.0, backgroundColorValue: HFSoftUIColor, isDarkColorScheme: isDarkColorScheme, isUpperWhiteRequired: isUpperWhiteRequired)
                
            } else {
                
                button?.HFSoftUIButton(backgroundColorValue: HFSoftUIColor, isDarkColorScheme: isDarkColorScheme, isUpperWhiteRequired: isUpperWhiteRequired)
                
            }
            
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewControllerTableViewCell
        
        cell.cellLabel.text = "Label: \(indexPath.row)"
     
        DispatchQueue.main.async {
            
            cell.cellOuterView.HFSoftUIView(backgroundColorValue: HFSoftUIColor)
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
