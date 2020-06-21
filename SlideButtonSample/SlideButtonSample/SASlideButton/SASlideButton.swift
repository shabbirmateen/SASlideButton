//
//  SlideButtonView.swift
//  SlideButtonView
//
//  Created by Shabbir Ahmad on 6/17/20.
//  Copyright © 2020 Shabbir. All rights reserved.
//

import UIKit

protocol ButtonDelegate : NSObject {
    func buttonActionCallback()
}

class SASlideButton: UIView {
    
    let titleLabel = UILabel()
    static var slideButtonWidth = CGFloat()
    
    // MARK: - Private Properties -
    @IBInspectable private var buttonColor:UIColor = #colorLiteral(red: 0.937254902, green: 0.3882352941, blue: 0.1411764706, alpha: 1)
    @IBInspectable private var titleColor:UIColor = #colorLiteral(red: 0, green: 0.4594393969, blue: 0.9334419966, alpha: 1)
    @IBInspectable private var spinnerColor:UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    // MARK: - Public Properties -
    @IBInspectable var spinner = SpinnerView()
    public var didButtonCalled: ((Int)->())?

    // MARK: - Public methods -
    public func resetButton() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                   self.spinner.transform = .identity
               }, completion: nil)
    }
    
    // MARK: - Init methods -
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.drawUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawUI()
    }
    
    // MARK: - Private methods -
    fileprivate func drawUI() {
        spinner.delegate = self
        self.layer.cornerRadius = self.frame.height/2
        SASlideButton.slideButtonWidth = self.bounds.width
        self.backgroundColor = buttonColor
        self.spinner.backgroundColor = spinnerColor
        self.spinner.frame = CGRect(x: 3, y: 3, width: self.frame.width/3, height: self.frame.height-6)
        self.spinner.layer.cornerRadius = self.spinner.frame.height/2
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        titleLabel.textAlignment = .center
        titleLabel.text = "Button"
        titleLabel.textColor = titleColor
        self.bringSubviewToFront(titleLabel)
        self.addSubview(titleLabel)
        self.addSubview(self.spinner)
    }
    
}

extension SASlideButton : ButtonDelegate {
    func buttonActionCallback() {
       // print("button clicked")
        self.didButtonCalled?(self.tag)
    }
}


class SpinnerView: UIView {
    weak var delegate:ButtonDelegate?
    
     // MARK: - Init methods -
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpUI()
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUI()
    }
    
   // MARK: - Private methods -
    fileprivate func setUpUI() {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handleGesture)))
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.transform = .identity
        }, completion: nil)
    }
   
    
    @objc func handleGesture(gesture:UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
                 if gesture.state == .began {
                   // print("began")
                 }else if gesture.state == .changed {
                     
                    if translation.x > 0 && translation.x < SASlideButton.slideButtonWidth - self.frame.width-6 {
                         
                     self.transform = CGAffineTransform(translationX:translation.x, y: 0)
                     }
                    
                    // print(translation.x)
                 }else if gesture.state == .ended {
                     if translation.x > SASlideButton.slideButtonWidth/2 {
                         UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                             self.transform = CGAffineTransform(translationX:SASlideButton.slideButtonWidth - self.frame.width-6, y: 0)
                                                   }, completion: nil)

                        self.delegate?.buttonActionCallback()
                      
                     }else {
                         UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                                        self.transform = .identity
                                    }, completion: nil)

                         
                     }
                    
                    // print("end")
                 }
                 
             }
    
}
