//
//  ViewController.swift
//  EzLoop
//
//  Created by iOS Student on 12/29/16.
//  Copyright © 2016 tek4fun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var margin: CGFloat = 40
    var n: Int = 0
    
    @IBOutlet weak var txt_balls: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func drawAction(_ sender: AnyObject) {
        n = Int(txt_balls.text!)!;
        drawBall()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func drawBall(){
        
        for subview in view.subviews {
            if subview .isKind(of: UIImageView.self) {
                subview.removeFromSuperview()
            }
        }
        for iRow in 0..<n{
            for iCollum in 0..<n {
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                ball.center = CGPoint(x: margin+CGFloat(iRow) * widthBetweenBall(), y: CGFloat(iCollum)*heightBetweenBall() + margin+20)
                self.view.addSubview(ball)
            }
        }
    }
    
    
    
    func widthBetweenBall() ->CGFloat{
        let space = (self.view.bounds.size.width - 2*margin)/CGFloat(n-1)
        return space
    }
    func heightBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.height - 2*margin)/CGFloat(n-1)
        return space
    }
    
    
}


