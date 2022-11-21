# ChatAppIOS

1) Go to File > Add Packages...

2) Paste the following URL in the search field at the top right: https://github.com/getstream/stream-chat-swift

3) Under Dependency Rule go with the "Up to Next Major Version" option and enter 4.0.0 as the version

4) Click the Add Package button

6) Add both StreamChat and StreamChatUI packages to the project

# AppDelegate.swift

    import UIKit
  
    import StreamChat
  
      // MARK: chatClient 
  
    extension ChatClient {
     static var shared: ChatClient!
    }
    
# SceneDelegate.swift

    import UIKit
    import StreamChat
    import StreamChatUI


    class SceneDelegate: UIResponder, UIWindowSceneDelegate {

        var window: UIWindow?


        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
            // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
            // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
              // MARK: StreamChat Config
            let config = ChatClientConfig(apiKey: .init("ajur4x6b9tjv"))

            let userId = "bharat"
            let token: Token =
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYmhhcmF0In0.dudK5LBgaY2bTPvX76lyri0t4vJZZCVKY1BEEfxBO2E"

            ChatClient.shared = ChatClient(config: config)

            ChatClient.shared.connectUser(
                userInfo: UserInfo(
                    id: userId,
                    name: "bharat"
                ),
                token: token
            )
            // MARK: rootViewController
            guard let _winF = (scene as? UIWindowScene) else { return }
            let window = UIWindow(windowScene: _winF)
            let vc = ViewController()
            window.rootViewController = UINavigationController(rootViewController: vc)
            window.makeKeyAndVisible()
      }

      func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
      }

      func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
      }

      func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
      }

      func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
      }

      func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
      }
    }
# ViewController.swift

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

# func 
         ==> // let cid = try? ChannelId(cid: "messaging:6377499b571b8751d4aa1df9") // <==
          let cid = try? ChannelId(cid: "messaging:6377499b571b8751d4aa1df9") 
          let vc = ChatChannelVC()
          vc.channelController = ChatClient.shared.channelController(for: cid!)
          let navVC = UINavigationController(rootViewController: vc)
          self.present(navVC, animated: true, completion: nil)
