//
//  ViewController.swift
//  chatUser1
//
//  Created by Chinmay Nagar on 20/11/22.
//

import UIKit
import StreamChat
import StreamChatUI
import CoreData
import Foundation

class DemoChannelList: ChatChannelListVC {}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   // button func
    @IBAction func openChat(_ sender: UIButton) {
        print("button clicked")
        // MARK: open chat
        let cid = try? ChannelId(cid: "messaging:6377499b571b8751d4aa1df9")
        let vc = ChatChannelVC()
        vc.channelController = ChatClient.shared.channelController(for: cid!)
        let navVC = UINavigationController(rootViewController: vc)
        self.present(navVC, animated: true, completion: nil)
    }
}

