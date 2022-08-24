//
//  File.swift
//  Habits
//
//  Created by 안지훈 on 8/22/22.
//

import Foundation
import Lottie
import UIKit

class LottieLaunch: UIViewController{
    
    @IBOutlet weak var lottieView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Launch called ")
        
        let customAnimationView = AnimationView(name: "Launch")
        
        customAnimationView.contentMode = .scaleAspectFit
        customAnimationView.loopMode = .repeat(1)
        customAnimationView.backgroundBehavior = .pauseAndRestore
        customAnimationView.animationSpeed = 0.6
        customAnimationView.play { [weak self] _ in
            let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let VC = Storyboard.instantiateViewController(identifier: "Main") as? UITabBarController else { return }
            VC.modalPresentationStyle = .fullScreen // 풀스크린으로 설정
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                self?.present(VC, animated: false, completion: nil)
            }
        }
        
        customAnimationView.translatesAutoresizingMaskIntoConstraints = false
        self.lottieView.addSubview(customAnimationView)
        
        
        NSLayoutConstraint.activate([
            customAnimationView.leftAnchor.constraint(equalTo: self.lottieView.leftAnchor),
            customAnimationView.rightAnchor.constraint(equalTo: self.lottieView.rightAnchor),
            customAnimationView.topAnchor.constraint(equalTo: self.lottieView.topAnchor,constant: -8),
            customAnimationView.bottomAnchor.constraint(equalTo: self.lottieView.bottomAnchor)
        ])
        
    }
    
    
    
    
}
