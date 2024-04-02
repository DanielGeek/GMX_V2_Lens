// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import { UUPSUpgradeable }from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "./MarketDataTypes.sol";

interface IVault {
    function poolAmounts(address _token) external view returns (uint256);
}

contract GMXLensV2 is MarketDataTypes, Initializable, UUPSUpgradeable, OwnableUpgradeable {

    // struct MarketDataState {
    //     address marketToken;
    //     address indexToken;
    //     address longToken;
    //     address shortToken;
    //     uint256 poolValue;
    //     uint256 longTokenAmount;
    //     uint256 longTokenUsd;
    //     uint256 shortTokenAmount;
    //     uint256 shortTokenUsd;
    //     int256 openInterestLong;
    //     int256 openInterestShort;
    //     int256 pnlLong;
    //     int256 pnlShort;
    //     int256 netPnl;
    //     uint256 borrowingFactorPerSecondForLongs;
    //     uint256 borrowingFactorPerSecondForShorts;
    //     bool longsPayShorts;
    //     uint256 fundingFactorPerSecond;
    //     int256 fundingFactorPerSecondLongs;
    //     int256 fundingFactorPerSecondShorts;
    //     uint256 reservedUsdLong;
    //     uint256 reservedUsdShort;
    //     uint256 maxOpenInterestUsdLong;
    //     uint256 maxOpenInterestUsdShort;
    // }

    // function initialize() public initializer {
    //     __Ownable_init(msg.sender);
    // }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function getMarketData(address marketID, address _vault) external view returns (MarketDataState memory) {
        // Interface for the GMX Market Data contract
        IVault vault = IVault(_vault);


        // Fetching data from the market data contract
        uint256 poolValue = vault.poolAmounts(marketID);

        // Constructing the MarketDataState struct to return
        MarketDataState memory state = MarketDataState({
            marketToken: marketID,
                indexToken: address(2),
                longToken: address(3),
                shortToken: address(4),
                poolValue: poolValue,
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

        return state;
    }

}
