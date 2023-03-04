import UIKit

final class LaunchAnimationController: UIViewController {
    
    // MARK: - View to open the screen
    
    private var launchAnimationView: LaunchAnimationView = LaunchAnimationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    // MARK: - ViewController Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        
        view = launchAnimationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        launchAnimationView.startAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            let vc = LocalStorage.isOnboardingFinished ? UINavigationController(rootViewController: MainViewController())  : OnboardingViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

}

