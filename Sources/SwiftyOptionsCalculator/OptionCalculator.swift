//
//  File.swift
//  
//
//  Created by Kaleb Cooper on 2/27/21.
//

import Foundation

public class OptionCalculator {
    
    public func getPrice(basedOn inputs: OptionInput) -> Double {
        switch inputs.formulaType {
        case .blackScholes:
            return getBlackScholesPrice(inputs)
        }
    }
    
    
    //----------------------------------------------------------------
    // MARK: - Black Scholes Model
    //----------------------------------------------------------------
    
    private func getBlackScholesPrice(_ inputs: OptionInput) -> Double {
        
        let currentStockPrice = inputs.currentPrice
        let strikePrice = inputs.strikePrice
        let interestRate = inputs.interestRate
        let impliedVolatility = inputs.impliedVolatility
        let timeToExpiration = inputs.timeToExpiration
        
        let currentStrikeValue = getStrikeValue(
            strikePrice: strikePrice,
            interestRate: interestRate,
            timeToExpiration: timeToExpiration
        )
        
        let normalizedVolatility = getVolatility(
            volatility: impliedVolatility,
            timeToExpiration: timeToExpiration
        )
        
        let d1 = getD1(current: currentStockPrice, strike: currentStrikeValue, volatility: normalizedVolatility)
        let d2 = getD2(current: currentStockPrice, strike: currentStrikeValue, volatility: normalizedVolatility)
        
        let d1Normalized = normalize(d1)
        let d2Normalized = normalize(d2)
        
        let callPrice = (currentStockPrice * d1Normalized) - (currentStrikeValue * d2Normalized)
        
        return callPrice
    }
    
    private func getD1(current stockValue: Double, strike strikeValue: Double, volatility: Double) -> Double {
        return log(stockValue / strikeValue) / volatility + 0.5 * volatility
    }
    
    private func getD2(current stockValue: Double, strike strikeValue: Double, volatility: Double) -> Double {
        return log(stockValue / strikeValue) / volatility - 0.5 * volatility
    }
    
    private func getVolatility(volatility: Double, timeToExpiration: Double) -> Double {
        return volatility * sqrt(timeToExpiration)
    }
    
    private func getStrikeValue(strikePrice: Double, interestRate: Double, timeToExpiration: Double) -> Double {
        return strikePrice * exp(-interestRate * sqrt(timeToExpiration))
    }
    
    
    //----------------------------------------------------------------
    // MARK: - Normal Distribution
    //----------------------------------------------------------------
    
    private func normalize(_ x: Double) -> Double {
        let t = 1 / (1 + 0.2316419 * abs(x))
        let d = 0.3989423 * exp(-x * x / 2)
        var probability = d * t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.821256 + t * 1.330274))))
        
        if (x > 0) {
            probability = 1 - probability
        }
        
        return probability
    }

}
