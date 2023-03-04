import UIKit

final class LaunchAnimationView: UIView {
    
    // MARK: - Variables UIImageViews
    
    private var surfView = UIImageView(image: UIImage(named: "surfPhrase"))
    private var educationView = UIImageView(image: UIImage(named: "educationPhrase"))
    
    // MARK: - Override init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods for setting up and creating animations
    
    func startAnimation() {
        educationView.frame = CGRect(x: 0, y: 0, width: 104, height: 104)
        educationView.center.x = bounds.midX
        educationView.center.y = bounds.midY
        addSubview(educationView)
        
        surfView.frame = CGRect(x: 0, y: 0, width: 104, height: 104)
        surfView.center.x = bounds.midX
        surfView.center.y = bounds.midY
        addSubview(surfView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.rotateAnimation(self.educationView, 0.5)
        }
    }
}

// MARK: - Extension LaunchAnimationView

private extension LaunchAnimationView {
    
    func settingUpImage(view: UIView) {
        educationView.frame = CGRect(x: 0, y: 0, width: 104, height: 104)
        educationView.center.x = view.bounds.midX
        educationView.center.y = view.bounds.midY
        addSubview(view)
    }
    
    
    func rotateAnimation(_ view: UIView, _ duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveEaseIn], animations: {
            view.transform = view.transform.rotated(by: .pi/2)
        }) { _ in
            UIView.animate(withDuration: duration, delay: 0.0, options: [.curveEaseOut], animations: {
                view.transform = view.transform.rotated(by: .pi/2)
                view.alpha = 0.0
            }) { _ in
                self.animationOfReduction(self.surfView, 0.5)
            }
        }
    }
    
    func animationOfReduction(_ view: UIView, _ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            view.transform = CGAffineTransform(scaleX: 1.1, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }) { _ in
                PermissionManager.checkCameraPermission { hasPermission in
                    LocalStorage.isCameraPermission = hasPermission
                }
            }
        }
    }
}
