//
//  PaymentService.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/19/21.
//  Copyright © 2021 Josh Sauder. All rights reserved.
//

import Foundation
import StoreKit

class PaymentService: SKPaymentTransactionObserver {
    
    func intiatePayment(purchaseId: String){
        if SKPaymentQueue.canMakePayments() {
            let req = SKMutablePayment()
            req.productIdentifier = purchaseId
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(req)
        } else {
            print("Can't make payments")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for t in transactions {
            if t.transactionState == .purchased {
                print("success")
            } else if t.transactionState == .restored {
                print("failed")
            } else {
                print("failed")
            }
        }
    }
    
    func restorePurchase(){
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
}
