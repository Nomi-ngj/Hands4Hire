//
//  MockSplashScreenViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 05/11/2024.
//

@testable import Hands4Hire

class MockSplashScreenViewModel: SplashScreenViewModel {
    var didStartAnimations = false

    override func startAnimations() {
        super.startAnimations()
        didStartAnimations = true
    }
}
