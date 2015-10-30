//
//  SearchFormViewModelTest.swift
//  Homie
//
//  Created by davix on 10/28/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import XCTest

@testable import Homie

class SearchFormViewModelTest : XCTestCase{
    
    let utils = Utils()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDeliveryLowerRange() {
        
        //Success Case
        
        //Normal Case
        var form = SearchForm()
        form.deliveryPriceRangeLow = "10.0"
        
        var viewModel = SearchFormViewModel(searchForm: form)
        XCTAssertEqual(viewModel.getDeliveryLowerBound() , 10.0)
        
        //Edge Case
        form.deliveryPriceRangeLow = ""
        viewModel = SearchFormViewModel(searchForm: form)
        XCTAssertEqual(viewModel.getDeliveryLowerBound() , 0.0)
        
        //Edge Case
        form.deliveryPriceRangeLow = nil
        viewModel = SearchFormViewModel(searchForm: form)
        XCTAssertEqual(viewModel.getDeliveryLowerBound() , 0.0)

    }
    
    func testGetDeliveryUpperRange() {
        
        //Success Case
        
        //Normal Case
        var form = SearchForm()
        form.deliveryPriceRangeHigh = "10.0"
        
        let viewModel = SearchFormViewModel(searchForm: form)
        XCTAssertEqual(viewModel.getDeliveryUpperBound() , 10.0)
        
        //Edge Case
        form.deliveryPriceRangeHigh = ""
        viewModel.searchForm = form
        XCTAssertEqual(viewModel.getDeliveryUpperBound() , 0.0)
        
        //Edge Case
        form.deliveryPriceRangeHigh = nil
        viewModel.searchForm = form
        XCTAssertEqual(viewModel.getDeliveryUpperBound() , 0.0)

    }
    
    func testGetPickUpLowerRange() {
        
        //Success Case
        
        //Normal Case
        var form = SearchForm()
        form.pickUpPriceRangeLow = "10.0"
        
        let viewModel = SearchFormViewModel(searchForm: form)
        XCTAssertEqual(viewModel.getPickupLowerBound() , 10.0)
        
        //Edge Case
        form.pickUpPriceRangeLow = ""
        viewModel.searchForm = form
        XCTAssertEqual(viewModel.getPickupLowerBound() , 0.0)
        
        //Edge Case
        form.pickUpPriceRangeLow = nil
        viewModel.searchForm = form
        XCTAssertEqual(viewModel.getPickupLowerBound() , 0.0)
        
    }
    
    func testGetPickUpUpperRange() {
        
        //Success Case
        
        //Normal Case
        var form = SearchForm()
        form.pickUpPriceRangeHigh = "10.0"
        
        let viewModel = SearchFormViewModel(searchForm: form)
        XCTAssertEqual(viewModel.getPickUpUpperBound() , 10.0)
        
        //Edge Case
        form.pickUpPriceRangeHigh = ""
        viewModel.searchForm = form
        XCTAssertEqual(viewModel.getPickUpUpperBound() , 0.0)
        
        //Edge Case
        form.pickUpPriceRangeHigh = nil
        viewModel.searchForm = form
        XCTAssertEqual(viewModel.getPickUpUpperBound() , 0.0)
        
    }
    
}