//
//  AccountViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 22.09.2021.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var accountStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let userPhoneNumber = Auth.auth().currentUser?.phoneNumber {
            accountStatusLabel.text = "User: \(userPhoneNumber) has login."
        } else {
            let controller = PhoneAuthViewController.instantiate()
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        let controller = PhoneAuthViewController.instantiate()
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            accountStatusLabel.text = "Sign out succes"
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            accountStatusLabel.text = "Error signing out"
        }
    }
    
    
    
}
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
//        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let scene = (scene as? UIWindowScene) else { return }
//
//        window = UIWindow(windowScene: scene)
//        var controller: UIViewController!
//
//        if Auth.auth().currentUser == nil {
//            controller = OnboardingViewController.instantiate()
//        } else {
//            print("catch user - \(Auth.auth().currentUser!.phoneNumber!)")
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            controller = storyboard.instantiateViewController(identifier: "TabBarController") as! UITabBarController
//        }
//        window?.rootViewController = controller
//        window?.makeKeyAndVisible()
//        }


