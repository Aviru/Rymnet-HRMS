//
//  BottomCornersRoundedImageView.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 23/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import UIKit

class BottomCornersRoundedImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            setup()
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            setup()
        }
    }
    @IBInspectable var trueBorderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = trueBorderWidth
            setup()
        }
    }
    
    
    override func layoutSubviews() {
        setup()
    }
    
    var border:CAShapeLayer? = nil
    
    func setup() {
        // make a path with round corners
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 6, height: 6))
        
        // note that it is >exactly< the size of the whole view
        
        // mask the whole view to that shape
        // note that you will ALSO be masking the border we'll draw below
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        // add another layer, which will be the border as such
        
        if (border == nil) {
            border = mask //CAShapeLayer()
            self.layer.addSublayer(border!)
        }
        // IN SOME APPROACHES YOU would INSET THE FRAME
        // of the border-drawing layer by the width of the border
        border!.frame = bounds.insetBy(dx: trueBorderWidth, dy: trueBorderWidth)
        // so that when you draw the line, ALL of the WIDTH of the line
        // DOES fall within the actual mask.
        
        // here, we will draw the border-line LITERALLY ON THE EDGE
        // of the path. that means >HALF< THE LINE will be INSIDE
        // the path and HALF THE LINE WILL BE OUTSIDE the path
        
        // border!.frame = bounds
        let pathUsingCorrectInsetIfAny = UIBezierPath(roundedRect: border!.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 6, height: 6))
        
        //UIBezierPath(roundedRect: border!.bounds, cornerRadius:cornerRadius)
        
        border!.path = pathUsingCorrectInsetIfAny.cgPath
        border!.fillColor = UIColor.clear.cgColor
        
        // the following is not what you want:
        // it results in "half-missing corners"
        // (note however, sometimes you do use this approach):
        //border!.borderColor = borderColor.cgColor
        // border!.borderWidth = trueBorderWidth
        
        // this approach will indeed be "inside" the path:
        border!.strokeColor = borderColor.cgColor
        border!.lineWidth = trueBorderWidth * 2.0
        // HALF THE LINE will be INSIDE the path and HALF THE LINE
        // WILL BE OUTSIDE the path. so MAKE IT >>TWICE AS THICK<<
        // as requested by the consumer class.
        
    }
    

}
