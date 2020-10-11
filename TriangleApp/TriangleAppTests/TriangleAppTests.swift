//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Gilang Ramadhan on 11/10/20.
//
import Foundation
import XCTest
@testable import TriangleApp

class TriangleAppTests: XCTestCase {

  func testDetectTriangle() {
    XCTAssertEqual(try detectTriangle(1, 2, 3), "Segitiga Sembarang")
  }

  func testInvalidInputDetectTriangle() {
    XCTAssertThrowsError(try detectTriangle(-1, -2, -3)) {error in
      XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
    }
  }

  func testDetectEquilateralTriangle() {
    XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
  }

  func testDetectIsoscelesTriangle() {
    XCTAssertEqual(try detectTriangle(1, 1, 2), "Segitiga Sama Kaki")
    XCTAssertEqual(try detectTriangle(1, 2, 1), "Segitiga Sama Kaki")
    XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
    XCTAssertEqual(try detectTriangle(2, 1, 2), "Segitiga Sama Kaki")
  }

  func detectTriangle(_ sideA: Int, _ sideB: Int, _ sideC: Int) throws -> String {
    let sides = [sideA, sideB, sideC].sorted()

    for side in sides {
      if side < 0 {
        throw TriangleError.invalidInput
      }
    }

    if (sides[0] == sides[1] && sides[0] == sides[2]) {
      return "Segitiga Sama Sisi"
    } else if (sides[0] == sides[1] || sides[1] == sides[2]) {
      return "Segitiga Sama Kaki"
    } else {
      return "Segitiga Sembarang"
    }
  }

}

enum TriangleError: Error {

  case invalidInput

}
