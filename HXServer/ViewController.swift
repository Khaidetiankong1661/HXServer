//
//  ViewController.swift
//  HXServer
//
//  Created by hongbaodai on 2018/1/11.
//  Copyright © 2018年 wang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var hintLabel: NSTextField!
    fileprivate lazy var serverMgr : ServerManager = ServerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startServer(_ sender: NSButton) {
        hintLabel.stringValue = "服务器已经开启ing"
        serverMgr.startRunning()
    }
    
    
    @IBAction func stopServer(_ sender: NSButton) {
        hintLabel.stringValue = "服务器未开启"
        serverMgr.stopRunning()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

