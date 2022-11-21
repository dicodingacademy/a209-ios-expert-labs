//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Gilang Ramadhan on 11/10/20.
//

import Quick
import Nimble
import Foundation
@testable import TriangleApp

class TriangleAppTests: QuickSpec {

  override func spec() {

    describe("Detect the Triangle") {
      context("given different values to each side", closure: {
        it("should detect Random Triangle", closure: {
          expect(try self.detectTriangle(3, 4, 5)).to(equal("Segitiga Sembarang"))
        })
      })
    }

    describe("Invalid Input on Detect Triangle") {
      context("given the sides are less than 1", closure: {
        it("should fail ", closure: {
          expect(try self.detectTriangle(-1, -2, -3)).to(throwError(TriangleError.invalidInput))
        })
      })
    }

    describe("Inequality Input on Detect Triangle") {
      context("given sideA plus sideB to be smaller than sideC", closure: {
        it("should fail ", closure: {
          expect(try self.detectTriangle(4, 1, 2)).to(throwError(TriangleError.inequalityInput))
          expect(try self.detectTriangle(5, 1, 3)).to(throwError(TriangleError.inequalityInput))
        })
      })
    }

    describe("Detect the Equilateral Triangle") {
      context("given all sides are equal", closure: {
        it("should detect Equilateral Triangle", closure: {
          expect(try self.detectTriangle(2, 2, 2)).to(equal("Segitiga Sama Sisi"))
        })
      })
    }

    describe("Detech the Isosceles Triangle") {
      context("given two sides are equal", closure: {
        it("should detect Isosceles Triangle", closure: {
          expect(try self.detectTriangle(8, 8, 10)).to(equal("Segitiga Sama Kaki"))
          expect(try self.detectTriangle(8, 10, 8)).to(equal("Segitiga Sama Kaki"))
          expect(try self.detectTriangle(8, 10, 10)).to(equal("Segitiga Sama Kaki"))
          expect(try self.detectTriangle(10, 8, 10)).to(equal("Segitiga Sama Kaki"))
        })
      })
    }

  }

  func detectTriangle(_ sideA: Int, _ sideB: Int, _ sideC: Int) throws -> String {
    let sides = [sideA, sideB, sideC].sorted()

    for side in sides {
      if side < 0 {
        throw TriangleError.invalidInput
      }
    }

    if (sides[1] + sides[0] <= sides[2]) {
      throw TriangleError.inequalityInput
    } else if sides[0] == sides[1] && sides[0] == sides[2] {
      return "Segitiga Sama Sisi"
    } else if sides[0] == sides[1] || sides[1] == sides[2] {
      return "Segitiga Sama Kaki"
    } else {
      return "Segitiga Sembarang"
    }
  }

}

enum TriangleError: Error {

  case invalidInput
  case inequalityInput

}
