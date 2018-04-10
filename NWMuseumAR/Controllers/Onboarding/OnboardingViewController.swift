//
//  OnboardingViewController.swift
//  NWMuseumAR
//
//  Created by Justin Leung on 4/9/18.
//  Copyright © 2018 NWMuseumAR. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController
{
    /** Image */
    let tutorialOneImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Tutorial Icon Page 1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    /** Title */
    let titleTextView: UITextView = {
        let title = UITextView()
        title.text = "Scan Displays & Earn Tokens"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 26)
        title.textColor = .mainTitleDark
        title.isEditable = false
        title.isScrollEnabled = false
        title.isSelectable = false
        title.backgroundColor = nil
        return title
    }()
    
    /** Description */
    let descriptionTextView: UITextView = {
        let description = UITextView()
        description.text = "Walk around and scan art displays to\n collect all of your unique tokens"
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .center
        description.font = UIFont.systemFont(ofSize: 16)
        description.textColor = .mainGray
        description.isEditable = false
        description.isScrollEnabled = false
        description.isSelectable = false
        description.backgroundColor = nil
        return description
    }()
    
    /** Prev Button */
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainGray, for: .normal)
        return button
    }()
    
    /** Next Button */
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainRed, for: .normal)
        return button
    }()
    
    /** Page Control */
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.pageIndicatorTintColor = .mainLightRed
        pc.currentPageIndicatorTintColor = .mainRed
        return pc
    }()
    
    /**
     * Initial view did load callback.
     */
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Set background color.
        view.backgroundColor = .mainBackground
        
        // Add subviews.
        view.addSubview(titleTextView)
        view.addSubview(descriptionTextView)
        
        // Enable bottom controls.
        setupBottomControls()
        
        // Sets up the layout.
        setupLayout()
    }
    
    /**
     * Setup the bottom controls.
     */
    fileprivate func setupBottomControls()
    {
        // Bottom Control Container
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        // Previous Button Constraints.
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
    
    /**
     * Dispose of any resources that can be recreated.
     */
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * Sets up the layout.
     */
    private func setupLayout()
    {
        // Image Container Layout.
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(tutorialOneImageView)
        topImageContainerView.backgroundColor = nil
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Image Layout.
        NSLayoutConstraint.activate([
            tutorialOneImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tutorialOneImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            tutorialOneImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            tutorialOneImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.465)
        ])
        
        // Title Layout.
        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: tutorialOneImageView.bottomAnchor, constant: -10),
            titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor),
            titleTextView.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: 3)
        ])
        
        // Description Layout.
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

/**
 * Extension for UIColor to help provide easier access
 * to primary application colors.
 */
extension UIColor
{
    static var mainRed = UIColor(red: 0.93, green: 0.51, blue: 0.51, alpha: 1.0)
    static var mainLightRed = UIColor(red:0.98, green: 0.90, blue: 0.90, alpha: 1.0)
    static var mainTitleDark = UIColor(red: 0.26, green: 0.28, blue: 0.37, alpha: 1.0)
    static var mainGray = UIColor(red: 0.67, green: 0.69, blue: 0.73, alpha: 1.0)
    static var mainBackground = UIColor(red: 0.9765, green: 0.9765, blue: 0.9804, alpha: 1.0)
}
