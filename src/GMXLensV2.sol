// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import { UUPSUpgradeable }from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract GMXLensV2 is Initializable, UUPSUpgradeable, OwnableUpgradeable {

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
        __Ownable_init(msg.sender);
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    // function getMarketData(address marketID) external view returns (MarketDataState memory) {
    //     // Interface for the GMX Market Data contract
    //     IGmxMarketData marketDataContract = IGmxMarketData(marketID);

    //     // Fetching data from the market data contract
    //     // This is a placeholder; you'll need to replace these calls with actual function calls to the GMX contract
    //     address marketToken = marketDataContract.getMarketToken();
    //     uint256 poolValue = marketDataContract.getPoolValue();
    //     // Continue fetching other required data fields in a similar fashion

    //     // Constructing the MarketDataState struct to return
    //     MarketDataState memory state = MarketDataState({
    //         marketToken: marketToken,
    //         poolValue: poolValue
    //         // Populate other fields similarly
    //     });

    //     return state;
    // }

}
