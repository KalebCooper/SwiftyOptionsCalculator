//
//  File.swift
//  
//
//  Created by Kaleb Cooper on 2/27/21.
//

import Combine
import Foundation

public class OptionInput: ObservableObject {
    
    /// The method used for calculating the value of the given option
    var formulaType: OptionFormulaType = .blackScholes
    
    /// current price of the underlying asset
    var currentPrice: Double
    /// strike price of the option
    var strikePrice: Double
    /// annual risk-free interest rate
    var interestRate: Double
    /// volatility of the underlying asset
    var impliedVolatility: Double
    /// time to expiration of the option in years
    var timeToExpiration: Double
    
    public init(currentPrice: Double,
                strikePrice: Double,
                interestRate: Double,
                impliedVolatility: Double,
                timeToExpiration: Double) {
        self.currentPrice = currentPrice
        self.strikePrice = strikePrice
        self.interestRate = interestRate
        self.impliedVolatility = impliedVolatility
        self.timeToExpiration = timeToExpiration
    }
}

extension OptionInput {
    func getMockOption() -> OptionInput {
        return OptionInput(
            currentPrice: 8.01,
            strikePrice: 7,
            interestRate: 0.01,
            impliedVolatility: 1.78724,
            timeToExpiration: 0.073972
        )
    }
}
