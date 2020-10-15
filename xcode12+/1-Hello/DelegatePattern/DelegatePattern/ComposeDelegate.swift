//
//  ComposeDelegate.swift
//  DelegatePattern
//
//  Created by Keun young Kim on 2020/10/08.
//

import UIKit

protocol ComposeDelegate {
    func composer(_ vc: UIViewController, didInput value: String?)
    func composerDidCancel(_ vc: UIViewController)
}

