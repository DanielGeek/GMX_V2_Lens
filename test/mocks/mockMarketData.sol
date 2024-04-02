// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../src/MarketDataTypes.sol";

contract mockMarketData is MarketDataTypes {
    function getMarketData(address marketID, address /*marketPool*/) external pure returns (MarketDataState memory) {
        // Mock logic to return mock data depending on the marketID
        if (marketID == address(1)) { 
            // Example marketID
            return MarketDataState({
                marketToken: marketID,
                indexToken: address(2),
                longToken: address(3),
                shortToken: address(4),
                poolValue: 1000,
                longTokenAmount: 500,
                longTokenUsd: 600,
                shortTokenAmount: 400,
                shortTokenUsd: 300,
                openInterestLong: 200,
                openInterestShort: -100,
                pnlLong: 50,
                pnlShort: -50,
                netPnl: 0,
                borrowingFactorPerSecondForLongs: 1e18,
                borrowingFactorPerSecondForShorts: 1e18,
                longsPayShorts: true,
                fundingFactorPerSecond: 1e18,
                fundingFactorPerSecondLongs: 1e18,
                fundingFactorPerSecondShorts: -1e18,
                reservedUsdLong: 100,
                reservedUsdShort: 100,
                maxOpenInterestUsdLong: 10000,
                maxOpenInterestUsdShort: 10000
            });
        } else if (marketID == address(2)) { 
            // Another example marketID
            return MarketDataState({
                marketToken: marketID,
                indexToken: address(5),
                longToken: address(6),
                shortToken: address(7),
                poolValue: 2000,
                longTokenAmount: 700,
                longTokenUsd: 800,
                shortTokenAmount: 500,
                shortTokenUsd: 400,
                openInterestLong: 300,
                openInterestShort: -200,
                pnlLong: 150,
                pnlShort: -150,
                netPnl: 0,
                borrowingFactorPerSecondForLongs: 2e18,
                borrowingFactorPerSecondForShorts: 2e18,
                longsPayShorts: false,
                fundingFactorPerSecond: 2e18,
                fundingFactorPerSecondLongs: 2e18,
                fundingFactorPerSecondShorts: -2e18,
                reservedUsdLong: 200,
                reservedUsdShort: 200,
                maxOpenInterestUsdLong: 20000,
                maxOpenInterestUsdShort: 20000
            });
        }

        // Returns a default value if the marketID does not match the previous cases
        return MarketDataState({
            marketToken: address(0),
            indexToken: address(0),
            longToken: address(0),
            shortToken: address(0),
            poolValue: 0,
            longTokenAmount: 0,
            longTokenUsd: 0,
            shortTokenAmount: 0,
            shortTokenUsd: 0,
            openInterestLong: 0,
            openInterestShort: 0,
            pnlLong: 0,
            pnlShort: 0,
            netPnl: 0,
            borrowingFactorPerSecondForLongs: 0,
            borrowingFactorPerSecondForShorts: 0,
            longsPayShorts: false,
            fundingFactorPerSecond: 0,
            fundingFactorPerSecondLongs: 0,
            fundingFactorPerSecondShorts: 0,
            reservedUsdLong: 0,
            reservedUsdShort: 0,
            maxOpenInterestUsdLong: 0,
            maxOpenInterestUsdShort: 0
        });
    }
}
