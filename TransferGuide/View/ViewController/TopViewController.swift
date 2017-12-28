//
//  TopViewController.swift
//  TransferGuide
//
//  Created by sillva on 2017/12/28.
//  Copyright © 2017年 sillva. All rights reserved.
//

import UIKit
import PromiseKit

final class TopViewController: UIViewController {
    let viewModel = TopViewModel()
    
    @IBAction func didTapOptionCondition(_ sender: UIButton) {
        performSegue(withIdentifier: R.segue.topViewController.gotoOptionCondition.identifier, sender: sender)
    }
    
    @IBAction func didTapDateCondition(_ sender: UIButton) {
        performSegue(withIdentifier: R.segue.topViewController.gotoDateCondition.identifier, sender: sender)
    }
    
    @IBAction func didTapSearch(_ sender: UIButton) {
        viewModel.searchRequest().then { (result) -> () in
            performSegue(withIdentifier: R.segue.topViewController.gotoResult.identifier,
                         sender: sender)
            return ()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let popoverPresentationController = segue.destination.popoverPresentationController {
            popoverPresentationController.delegate = self
        }
    }
}

extension TopViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
