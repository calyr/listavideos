//
//  ViewController.swift
//  ListasVideo
//
//  Created by calyr on 8/7/16.
//  Copyright © 2016 calyr. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var index : Int = 0
    
    private var reproductor = AVPlayer()
    private var controlador = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    /*    // Do any additional setup after loading the view, typically from a nib.
        let videoURL = NSBundle.mainBundle().URLForResource("primero", withExtension: "MP4")
        reproductor =  AVPlayer(URL: videoURL!)
        controlador = AVPlayerViewController()
        controlador.player = reproductor
        
        self.addChildViewController(controlador)
        controlador.view.frame = CGRectMake(10,20,300,250)
        self.view.addSubview(controlador.view)
        reproductor.play()*/
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let fileURL = NSURL(fileURLWithPath: "/Users/calyr/Documents/Movil/ios/ListasVideo/ListasVideo/primero.MP4")
        reproductor = AVPlayer(URL: fileURL)
        controlador.player = reproductor
        
        /*self.presentViewController(controlador, animated: true){
            self.controlador.player?.play()
        }*/
        self.addChildViewController(controlador)
        controlador.view.frame = CGRectMake(10,70,300,250)
        self.view.addSubview(controlador.view)
        reproductor.play()
        
        
    }

    @IBAction func lessVol() {
        print(reproductor.volume)
        if(reproductor.volume > 0.0){
            reproductor.volume--
        }
        
    }
    @IBAction func addVol() {
        print(reproductor.volume)
        reproductor.volume++
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func controlVolumen(sender: UISlider) {
        reproductor.volume = sender.value
    }


}

