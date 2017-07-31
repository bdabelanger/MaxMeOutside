//
//  ViewController.swift
//  MaxMeOutside
//
//  Created by Ben on 4/17/17.
//  Copyright © 2017 Ben. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = self.view.bounds
        view.insertSubview(visualEffectView, at: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        imageView.layer.cornerRadius = 120
        imageView.clipsToBounds = true
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        imageView.isHidden = false
        playSound()
        rotateView(targetView: imageView, duration: 2.0)
        rotateView(targetView: imageView, duration: 2.0)
    }
    
    private func rotateView(targetView: UIView, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(M_PI))
        })
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "max", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

