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
    
    @IBOutlet weak var imagenThu: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
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
    //Users/callisaya/Documents/listavideos/ListasVideo/0102.Biographical Information On The Author.mp4
    override func viewDidAppear(animated: Bool) {
        cargarMusica(index)
        
        
    }
    @IBAction func cambiarCancion() {
        
        
        let indexrandom = Int(arc4random_uniform( UInt32(mylist.count) ) )
        cargarMusica(indexrandom)
    
    }
    
    func cargarMusica(index:Int){
        print("El index es \(index)")
        let videodata = mylist[index].componentsSeparatedByString(".")
        self.myTitle.text = videodata[0]
        let path = NSBundle.mainBundle().pathForResource(videodata[0], ofType:videodata[1])!
        print(path)
        //let fileURL = NSURL(fileURLWithPath: "/Users/callisaya/Documents/listavideos/ListasVideo/cuarto.mp4")
        let fileURL = NSURL(fileURLWithPath: path)
        imagenThu.image = previewImageForLocalVideo(fileURL)
        reproductor = AVPlayer(URL: fileURL)
        controlador.player = reproductor
        
        /*self.presentViewController(controlador, animated: true){
         self.controlador.player?.play()
         }*/
        self.addChildViewController(controlador)
        controlador.view.frame = CGRectMake(10,250,300,250)
        self.view.addSubview(controlador.view)
        reproductor.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func controlVolumen(sender: UISlider) {
        reproductor.volume = sender.value
    }
    
    func previewImageForLocalVideo(url:NSURL) -> UIImage?
    {
        let asset = AVAsset(URL: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        var time = asset.duration
        //If possible - take not the first frame (it could be completely black or white on camara's videos)
        time.value = min(time.value, 2)
        
        do {
            let imageRef = try imageGenerator.copyCGImageAtTime(time, actualTime: nil)
            return UIImage(CGImage: imageRef)
        }
        catch let error as NSError
        {
            print("Image generation failed with error \(error)")
            return nil
        }
    }


}

