//
//  File.swift
//  
//
//  Created by Kaleb Cooper on 2/27/21.
//

import Combine
import Foundation

public class Option: ObservableObject {
    
    //----------------------------------------------------------------
    // MARK: - Public API
    //----------------------------------------------------------------
    
    @Published var inputs: OptionInput
    @Published var price: Double
    
    init(_ inputs: OptionInput) {
        self.inputs = inputs
        self.price = calculator.getPrice(basedOn: inputs)
    }
    
    //----------------------------------------------------------------
    // MARK: - Public API
    //----------------------------------------------------------------
    
    public func recalculate(using newInputs: OptionInput)  {
        inputs = newInputs
        price = calculator.getPrice(basedOn: newInputs)
    }
    
    
    //----------------------------------------------------------------
    // MARK: - Private API
    //----------------------------------------------------------------
    
    private let calculator = OptionCalculator()
}
