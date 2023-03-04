//
//  OnboardingViewController.swift
//  Template
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet private var pagesView: UIView!
    @IBOutlet private var nextPageButton: UIButton!
    @IBOutlet private weak var closeButton: UIButton!
    
    private var pageController: UIPageViewController?
    private var childControllers: [UIViewController] = []

    private let pages = OnboardingPage.all
    private var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
        setupNextPageButton()
        setupCloseButton()
    }

}

extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = childControllers.firstIndex(of: viewController) else {
            return nil
        }

        return childControllers[safe: index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = childControllers.firstIndex(of: viewController) else {
            return nil
        }
        return childControllers[safe: index + 1]
    }

}

private extension OnboardingViewController {

    func setupPageController() {
        view.layoutIfNeeded()

        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.pageController = pageController

        pageController.dataSource = self
        pageController.delegate = self

        pageController.view.backgroundColor = .clear
        pageController.view.frame = pagesView.frame
        pageController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        childControllers = OnboardingPage.all.map { OnboardingPageViewController(model: $0) }
        pageController.setViewControllers(
            [childControllers[0]],
            direction: .forward,
            animated: false
        )

        self.addChild(pageController)
        pagesView.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }

    func setupNextPageButton() {
        nextPageButton.backgroundColor = Colors.buttonColor
        nextPageButton.tintColor = Colors.titleButtonColor
        nextPageButton.titleLabel?.font = Fonts.buttonFont
        nextPageButton.layer.cornerRadius = 12.0
        
        updateNextPageButton()
    }
    
    func setupCloseButton() {
        let image = UIImage(named: "xmark")
        closeButton.setImage(image, for: .normal)
        closeButton.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        closeButton.tintColor = Colors.titleButtonColor
        closeButton.backgroundColor = Colors.buttonColor
        closeButton.layer.cornerRadius = 16
    }

    func updateNextPageButton() {
        let isLastPage = pageIndex == pages.count - 1
        let titleKey = isLastPage ? "Onboarding.finalPage" : "Onboarding.nextPage"
        nextPageButton.setTitle(.localized(key: titleKey), for: .normal)
    }

    func finishOnboarding() {
        LocalStorage.isOnboardingFinished = true
        let vc = MainViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}

private extension OnboardingViewController {

    @IBAction func handleNextPagePressed() {
        pageIndex += 1
        guard pageIndex < pages.count else {
            finishOnboarding()
            return
        }

        pageController?.setViewControllers(
            [childControllers[pageIndex]],
            direction: .forward,
            animated: true
        )
        updateNextPageButton()
    }

    @IBAction func handleClosePressed() {
        finishOnboarding()
    }
    
    

}
