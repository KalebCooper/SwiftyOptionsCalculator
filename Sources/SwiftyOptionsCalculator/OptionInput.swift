//
//  File.swift
//  
//
//  Created by Kaleb Cooper on 2/27/21.
//

import Combine

public class OptionInput: ObservableObject {
    
    /// The method used for calculating the value of the given option
    public var formulaType: OptionFormulaType = .blackScholes
    
    /// current price of the underlying asset
    public var currentStockPrice: Double
    /// strike price of the option
    public var strikePrice: Double
    /// annual risk-free interest rate
    public var interestRate: Double
    /// volatility of the underlying asset
    public var impliedVolatility: Double
    /// time to expiration of the option in years
    public var timeToExpiration: Double
    
    public init(currentPrice: Double,
                strikePrice: Double,
                interestRate: Double,
                impliedVolatility: Double,
                timeToExpiration: Double) {
        self.currentStockPrice = currentPrice
        self.strikePrice = strikePrice
        self.interestRate = interestRate
        self.impliedVolatility = impliedVolatility
        self.timeToExpiration = timeToExpiration
    }
}

extension OptionInput {
    public static func getMockOptionInput() -> OptionInput {
        return OptionInput(
            currentPrice: 8.01,
            strikePrice: 7,
            interestRate: 0.01,
            impliedVolatility: 1.78724,
            timeToExpiration: 0.073972
        )
    }
}
