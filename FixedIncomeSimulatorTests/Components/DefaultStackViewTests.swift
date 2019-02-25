//
//  DefaultStackViewTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class DefaultStackViewTests: QuickSpec {
    override func spec() {
        describe("DefaultStackViewTests") {
            var sut: DefaultStackView!

            context("when you try to instantiate DefaultStackView with no arguments") {
                beforeEach {
                    sut = DefaultStackView()
                }

                it("should have the expected layout") {
                    expect(sut.translatesAutoresizingMaskIntoConstraints) == false
                    expect(sut.axis) == .horizontal
                    expect(sut.distribution) == .fillProportionally
                    expect(sut.spacing) == 0
                }
            }
        }
    }
}
