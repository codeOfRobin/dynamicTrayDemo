//
//  ViewController.swift
//  DynamicTrayDemo
//
//  Created by Robin Malhotra on 02/08/15.
//  Copyright © 2015 Robin Malhotra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let trayView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.ExtraLight))
    var leftEdgeConstraint = NSLayoutConstraint()
    var animator : UIDynamicAnimator?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "iMac.jpg"))
        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.contentMode=UIViewContentMode.ScaleAspectFill
        view.addSubview(imageView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["imageView"] = imageView
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: [], metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: [], metrics: nil, views: viewBindingsDict))

        animator = UIDynamicAnimator(referenceView: view)
        setupTrayView()
        setupGestureRecognizers()
        setupBehaviours()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupGestureRecognizers()
    {
        let recog = UIScreenEdgePanGestureRecognizer(target: self, action: Selector("pan:"))
        recog.edges = UIRectEdge.Right
        view.addGestureRecognizer(recog)
        
        let trayPan = UIPanGestureRecognizer(target: self, action: Selector("pan:"))
        trayView.addGestureRecognizer(trayPan)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    func setupBehaviours()
    {
        let edgeCollisionBehaviour = UICollisionBehavior(items: [trayView])
        
    }
    
    func pan(sender:AnyObject)
    {
        print("pan")
    }
    
    func setupTrayView()
    {
        trayView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(trayView)
        view.addConstraint(NSLayoutConstraint(item: trayView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: trayView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: trayView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        leftEdgeConstraint = NSLayoutConstraint(item: trayView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: view.frame.size.width)
        view.addConstraint(leftEdgeConstraint)
        let trayLabel = UILabel()
        trayLabel.text = "dsafkjhsadkf\nasdoifjsadf\nsdafdsakfasdf"
        trayLabel.numberOfLines=0
        trayLabel.font = UIFont.systemFontOfSize(24)
        trayLabel.translatesAutoresizingMaskIntoConstraints=false
        trayView.addSubview(trayLabel)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["trayLabel"] = trayLabel
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(30)-[trayLabel]-(30)-|", options: [], metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(100)-[trayLabel]-(100)-|", options: [], metrics: nil, views: viewBindingsDict))
        view.layoutIfNeeded()
        
    }
    


}

