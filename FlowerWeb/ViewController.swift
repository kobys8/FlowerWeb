//
//  ViewController.swift
//  FlowerWeb
//
//  Created by Koby Samuel on 10/13/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var colorChoice: UISegmentedControl!
	@IBOutlet weak var flowerView: UIWebView!
	@IBOutlet weak var flowerDetailView: UIWebView!

	@IBAction func getFlower(sender: AnyObject?) {
		var imageURL: NSURL
		var detailURL: NSURL
		var imageURLString: String
		var detailURLString: String
		var color: String
		let sessionID: Int = random()  % 50000
		color = colorChoice.titleForSegmentAtIndex(colorChoice.selectedSegmentIndex)!
		imageURLString = "https://www.floraphotographs.com/showrandomios.php?color=\(color)&session=\(sessionID)"
		detailURLString = "https://www.floraphotographs.com/detailios.php?session=\(sessionID)"
		imageURL = NSURL(string: imageURLString)!
		detailURL = NSURL(string: detailURLString)!
		flowerView.loadRequest(NSURLRequest(URL: imageURL))
		flowerDetailView.loadRequest(NSURLRequest(URL: detailURL))
	}
	
	@IBAction func toggleFlowerDetail(sender: AnyObject) {
		flowerDetailView.hidden = !(sender as! UISwitch).on
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		flowerDetailView.hidden = true
		getFlower(nil)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

