//
//  SaveEntryViewControllerDelegate.swift
//  RestTest
//
//  Created by David Fekke on 7/28/16.
//  Copyright © 2016 David Fekke. All rights reserved.
//

import Foundation
import UIKit

protocol SaveEntryViewControllerDelegate {
    func didFinishSaving(controller: UIViewController, entry: String)
}
