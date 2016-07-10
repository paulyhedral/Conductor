//
//  ConductorPageViewController.swift
//  Conductor
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 * A view controller for a page in the conductor view. You shouldn't have to create these, unless you are implementing
 * your own data source.
 */
public class ConductorPageViewController: UIViewController {

    /**
     * Interface Builder property for the title label UI element.
     * This element's content is set by setting properties of the `pageData` property.
     */
    @IBOutlet weak var titleLabel: UILabel!
    /**
     * Interface Builder property for the image view UI element.
     * This element's content is set by setting properties of the `pageData` property.
     */
    @IBOutlet weak var imageView: UIImageView!
    /**
     * Interface Builder property for the body text UI element.
     * This element's content is set by setting properties of the `pageData` property.
     */
    @IBOutlet weak var bodyTextView: UITextView!
    /**
     * Interface Builder property for the advance button UI element.
     * This element's content is set by setting properties of the `pageData` property.
     */
    @IBOutlet weak var advanceButton: UIButton!
    /**
     * Interface Builder property for the skip button UI element.
     * This element's content is set by setting properties of the `pageData` property.
     */
    @IBOutlet weak var skipButton: UIButton!

    /**
     * Property to store the page number of the view that this controller represents.
     */
    public var pageNumber : Int = 0
    /**
     * Property to store the page data that this controller should display.
     */
    public var pageData : ConductorPageData?

    override public func viewDidLoad() {
        super.viewDidLoad()

        updatePage()
    }


    // MARK: - Private methods

    private func updatePage() {

        if let pageData = self.pageData {

            // title
            if let title = pageData.titleText {
                titleLabel.text = title
                titleLabel.hidden = false
            }
            else {
                titleLabel.hidden = true
            }

            // image
            if let image = pageData.image {
                imageView.image = image
                imageView.hidden = false
            }
            else {
                imageView.hidden = true
            }

            // body
            bodyTextView.text = pageData.bodyText

            // advance button
            advanceButton.titleLabel?.text = pageData.advanceText ?? NSLocalizedString("conductor.page.advance.title", comment: "Advance button text")

            // skip button
            skipButton.hidden = pageData.hideSkipButton ?? false
        }
    }


    // MARK: - UI callbacks

    @IBAction func advanceTouched(sender: UIButton) {
        //        .sendAction(#selector(ConductorViewController.advanceTouched(_:)), to: nil, from: self, forEvent: nil)
    }

    @IBAction func skipTouched(sender: UIButton) {
        //        UIApplication.sharedApplication().sendAction(#selector(ConductorViewController.skipTouched(_:)), to: nil, from: self, forEvent: nil)
    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}