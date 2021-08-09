//
//  DDtableViewController+Helper.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//
import UIKit
@testable import Digitat14Demo

extension DDTableViewController {
    func errorMessage() -> String? {
        presentedAlertView()?.message
    }
    
    func hideError() {
        presenterVC.dismiss(animated: false, completion: nil)
    }
    
    private func presentedAlertView() -> UIAlertController? {
        presenterVC.presentedViewController as? UIAlertController
    }
    
    func isShowingLoadingIndicator() -> Bool {
        refreshControl?.isRefreshing == true
    }
    
    func simulateRefresh() {
        refreshControl?.sendActions(for: .valueChanged)
    }
    
    func numberOfRows(atSection section: Int) -> Int {
        tableView.numberOfSections > section ? tableView.numberOfRows(inSection: section) : 0
    }
    
    func cell(at indexPath: IndexPath) -> DDSeatGeekListTableViewCell? {
        guard numberOfRows(atSection: indexPath.section) > indexPath.row else { return nil }
        return tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? DDSeatGeekListTableViewCell
    }
    
    func name(at indexPath: IndexPath) -> String? {
        cell(at: indexPath)?.nameLabel?.text
    }
    
    func address(at indexPath: IndexPath) -> String? {
        cell(at: indexPath)?.addressLabel?.text
    }
    
    func timestamp(at indexPath: IndexPath) -> String? {
        cell(at: indexPath)?.timestampLabel?.text
    }
    
    func select(at indexPath: IndexPath) {
        tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
    }
}

