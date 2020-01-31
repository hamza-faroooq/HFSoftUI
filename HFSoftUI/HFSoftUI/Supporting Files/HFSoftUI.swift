//
//  HFSoftUI.swift
//  HFSoftUI
//
//  Created by Hamza on 29/01/2020.
//  Copyright © 2020 Hamza. All rights reserved.
//

/*

This example project is writter to give you the understanding of how you can use HFSoftUI extension to make Neumorphic Effect also know as SoftUI effect.
There are several ways you can use this extension and customize the effect at your own ease.
 
Do open an issue on the repo if you find one, or don't undestand how things are working. Well I tried my best to give you the basic understanding.
Do spare it some stars if you find it cool... ENJOY... ;-)

*/

import UIKit

extension UIButton {
    
    func HFSoftUIButton(shadowRadiusValue: CGFloat = 2, shadowOpacityValue: Float = 0.8, backgroundColorValue: UIColor, cornerRadiusValue: CGFloat = 8, isDarkColorScheme: Bool = false, isUpperWhiteRequired: Bool = false) {
        
        //setting values
        let layersArrayForUIButton: [CAShapeLayer] = [CAShapeLayer(), CAShapeLayer()]
        let sizeArray: [CGSize] = [.init(width: shadowRadiusValue, height: shadowRadiusValue), .init(width: -shadowRadiusValue, height: -shadowRadiusValue)]
        var colorArray: [UIColor] = []
        
        if isDarkColorScheme {
            
            if isUpperWhiteRequired {
                colorArray = [.black, .white]
            } else {
                colorArray = [.black, .lightGray]
            }
            
        } else {
            
            colorArray = [.lightGray, .white]
            
        }
        
        self.layer.cornerRadius = cornerRadiusValue
        self.isMultipleTouchEnabled = false
        
        // removing all sublayers that are already created
        if self.layer.sublayers?.count != 0 {
            self.layer.sublayers = self.layer.sublayers?.filter({
                return ($0.name != "0" && $0.name != "1")
            })
        }
        
        // applying shadow on button
        for (index, item) in layersArrayForUIButton.enumerated() {

            item.name = "\(index)"
            item.frame = self.layer.bounds
            item.cornerRadius = cornerRadiusValue
            item.backgroundColor = backgroundColorValue.cgColor
            item.shadowRadius = abs(shadowRadiusValue)
            item.shadowOpacity = abs(shadowOpacityValue)
            item.shadowColor = colorArray[index].cgColor
            item.shadowOffset = sizeArray[index]

            self.layer.insertSublayer(item, below: self.imageView?.layer)

        }
        
    }
    
}

extension UIView {
    
    func HFSoftUIView(shadowRadiusValue: CGFloat = 2, shadowOpacityValue: Float = 0.8, backgroundColorValue: UIColor, cornerRadiusValue: CGFloat = 8, isDarkColorScheme: Bool = false, isUpperWhiteRequired: Bool = false) {
        
        //setting values
        let layersArrayForUIView: [CAShapeLayer] = [CAShapeLayer(), CAShapeLayer()]
        let sizeArray: [CGSize] = [.init(width: shadowRadiusValue, height: shadowRadiusValue), .init(width: -shadowRadiusValue, height: -shadowRadiusValue)]
        var colorArray: [UIColor] = []
        
        if isDarkColorScheme {
            
            if isUpperWhiteRequired {
                colorArray = [.black, .white]
            } else {
                colorArray = [.black, .lightGray]
            }
            
        } else {
            
            colorArray = [.lightGray, .white]
            
        }
        
        self.layer.cornerRadius = cornerRadiusValue
        
        // removing all sublayers that are already created
        if self.layer.sublayers?.count != 0 {
            self.layer.sublayers = self.layer.sublayers?.filter({
                return ($0.name != "0" && $0.name != "1")
            })
        }
        
        // applying shadow on view
        for (index, item) in layersArrayForUIView.enumerated() {

            item.name = "\(index)"
            item.frame = self.layer.bounds
            item.cornerRadius = cornerRadiusValue
            item.backgroundColor = backgroundColorValue.cgColor
            item.shadowRadius = abs(shadowRadiusValue)
            item.shadowOpacity = abs(shadowOpacityValue)
            item.shadowColor = colorArray[index].cgColor
            item.shadowOffset = sizeArray[index]

            self.layer.insertSublayer(item, at: 0)

        }
        
    }
    
}

extension UIButton {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if self.layer.sublayers?.count != 1 && self.layer.sublayers?.count != nil {
         
            swap(&self.layer.sublayers![0].shadowOffset, &self.layer.sublayers![1].shadowOffset)
            
        }
        
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if self.layer.sublayers?.count != 1 && self.layer.sublayers?.count != nil {
         
            swap(&self.layer.sublayers![0].shadowOffset, &self.layer.sublayers![1].shadowOffset)
            
        }

    }
    
}
