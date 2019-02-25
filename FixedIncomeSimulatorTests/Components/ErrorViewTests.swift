//
//  ErrorViewTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import FixedIncomeSimulator

final class ErrorViewTests: QuickSpec {
    override func spec() {
        describe("ErrorViewTests") {
            var sut: ErrorView!

            context("when you tried to instantiate ErrorView with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = ErrorView(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {
                beforeEach {
                    sut = ErrorView(message: "Fill the fields correctly.")
                    sut.frame = CGRect(x: 0, y: 0, width: 414, height: 80)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
