// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract GMXLensV2 is Initializable {

    struct MarketDataState {
        address marketToken;
        address indexToken;
        address longToken;
        address shortToken;
        uint256 poolValue;
        uint256 longTokenAmount;
        uint256 longTokenUsd;
        uint256 shortTokenAmount;
        uint256 shortTokenUsd;
        int256 openInterestLong;
        int256 openInterestShort;
        int256 pnlLong;
        int256 pnlShort;
        int256 netPnl;
        uint256 borrowingFactorPerSecondForLongs;
        uint256 borrowingFactorPerSecondForShorts;
        bool longsPayShorts;
        uint256 fundingFactorPerSecond;
        int256 fundingFactorPerSecondLongs;
        int256 fundingFactorPerSecondShorts;
        uint256 reservedUsdLong;
        uint256 reservedUsdShort;
        uint256 maxOpenInterestUsdLong;
        uint256 maxOpenInterestUsdShort;
    }

    function initialize() public initializer {
        // Initialization logic here
    }

    function getMarketData(address marketID) external view returns (MarketDataState memory) {
        // Implement the logic to retrieve market data
    }
}
