//
//  DescriptionLabelTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import FixedIncomeSimulator

final class DescriptionLabelTests: QuickSpec {
    override func spec() {
        describe("DescriptionLabelTests") {
            var sut: DescriptionLabel!

            context("when you tried to instantiate DescriptionLabel with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = DescriptionLabel(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {
                beforeEach {
                    sut = DescriptionLabel(text: "Quanto você gostaria de aplicar?*")
                    sut.frame = CGRect(x: 0, y: 0, width: 374, height: 15.67)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
