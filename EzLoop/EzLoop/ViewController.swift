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
    var n: Int = 6
    var lastOnLed = -1
    var a:[[UIImageView]] = [[UIImageView]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBall()
        drawBall()
        setTag()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
    }
    
    func runningLed(){
        if lastOnLed < n*n{
            if lastOnLed != -1{
                turnOffLedbyRow()
            }
            lastOnLed = lastOnLed + 1
            turnOnLedbyRow()
            
        }else{
            lastOnLed = -1
        }
    }
    
    func turnOnLedbyRow(){
        if let ball = self.view.viewWithTag(100+lastOnLed )
            as? UIImageView
        {
            ball.image = UIImage(named:"green")
        }
    }
    func turnOffLedbyRow(){
        if let ball = self.view.viewWithTag(100+lastOnLed )
            as? UIImageView
        {
            ball.image = UIImage(named:"grey")
        }
    }
    
    func createBall(){
        for iCol in 0..<n{
            var _ball:[UIImageView] = [UIImageView]()
            for iRow in 0..<n {
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                ball.center = CGPoint(x: margin+CGFloat(iRow) * widthBetweenBall(), y: CGFloat(iCol) * heightBetweenBall() + margin)
                _ball.append(ball)
            }
            a.append(_ball)
        }
    }
    
    func drawBall(){
        for i in 0..<a.count{
            let b:[UIImageView] = a[i]
            for j in 0..<b.count{
                self.view.addSubview(a[i][j])
            }
        }
    }
    
    func setTag(){
        var r = 1, c = 0, i = 0, j = 0, imin = 0, jmin = 0, imax = n-1, jmax = n-1, image = UIImageView()
        while r <= n*n {
            if(j < jmax && i == imin){
                image = a[i][j]
                image.tag = 100 + c
                c += 1
                a[i][j] = image
                j += 1
            }
            if(j == jmax && i < imax){
                image = a[i][jmax]
                image.tag = 100 + c
                c += 1
                a[i][jmax] = image
                i += 1
            }
            if(i == imax && j > jmin){
                image = a[i][j]
                image.tag = 100 + c
                c += 1
                a[i][j] = image
                j -= 1
            }
            if(j == jmin && i > imin){
                image = a[i][jmin]
                image.tag = 100 + c
                c += 1
                a[i][jmin] = image
                i -= 1
            }
            
            if(i == imin && j == jmin){
                imin += 1
                jmin += 1
                imax -= 1
                jmax -= 1
                i = imin
                j = jmin
            }
            r += 1
            print("r",r)
        }
        print("c",c)
        
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


