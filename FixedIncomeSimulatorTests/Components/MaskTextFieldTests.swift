//
//  MaskTextFieldTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import FixedIncomeSimulator

final class MaskTextFieldTests: QuickSpec {
    override func spec() {
        describe("MaskTextFieldTests") {
            var sut: MaskTextField!

            context("when you tried to instantiate MaskTextField with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = MaskTextField(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {
                beforeEach {
                    sut = MaskTextField(placeholder: "R$", maskStyle: .currency)
                    sut.frame = CGRect(x: 0, y: 0, width: 374, height: 50)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
