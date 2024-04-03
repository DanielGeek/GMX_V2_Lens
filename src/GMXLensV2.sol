// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import { UUPSUpgradeable }from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "./MarketDataTypes.sol";

interface IVault {
    function poolAmounts(address _token) external view returns (uint256);
}

interface IOrderStoreUtils {
    function IS_LONG() external view returns (bytes32);
}

interface IDepositStoreUtils {
    function INITIAL_LONG_TOKEN() external view returns (bytes32);
    function INITIAL_LONG_TOKEN_AMOUNT() external view returns (bytes32);
    function INITIAL_SHORT_TOKEN() external view returns (bytes32);
    function INITIAL_SHORT_TOKEN_AMOUNT() external view returns (bytes32);
}

interface IMarketStoreUtils {
    function INDEX_TOKEN() external view returns (bytes32);
    function LONG_TOKEN() external view returns (bytes32);
    function SHORT_TOKEN() external view returns (bytes32);
}

interface IPositionStoreUtils {
    function BORROWING_FACTOR() external view returns (bytes32);
}

contract GMXLensV2 is MarketDataTypes, Initializable, UUPSUpgradeable, OwnableUpgradeable {

    function initialize() public initializer {
        __Ownable_init(msg.sender);
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function getMarketData(address marketID, address _vault) external view returns (MarketDataState memory) {
        // Interface for the GMX Market Data contract
        IVault vault = IVault(_vault);
        IOrderStoreUtils orderStoreUtils = IOrderStoreUtils(0x97BeB5A20FBd4596c8B19a89Ec399a100e57d14d);
        IDepositStoreUtils depositStoreUtils = IDepositStoreUtils(0x98e86155abf8bCbA566b4a909be8cF4e3F227FAf);
        IMarketStoreUtils marketStoreUtils = IMarketStoreUtils(0x5a1344252f0CdfDB765DD5ab97C98734f1D7ED6d);
        IPositionStoreUtils positionStoreUtils = IPositionStoreUtils(0x4a57C9b3d6c96954e397Cc186F98fCD2816A95C7);


        // Fetching data from the market data contract
        uint256 poolValue = vault.poolAmounts(marketID);

        // bytes32 isLongValue = orderStoreUtils.IS_LONG();
        // address isLongAddress = address(uint160(uint256(isLongValue)));

        // bytes32 initialShortToken = depositStoreUtils.INITIAL_SHORT_TOKEN();
        // address initialShortTokenAddress = address(uint160(uint256(initialShortToken)));

        // bytes32 indexToken = marketStoreUtils.INDEX_TOKEN();
        // address indexTokenAddress = address(uint160(uint256(indexToken)));

        // bytes32 longToken = marketStoreUtils.LONG_TOKEN();
        // address longTokenAddress = address(uint160(uint256(longToken)));
        
        // bytes32 shortToken = marketStoreUtils.SHORT_TOKEN();
        // address shortTokennAddress = address(uint160(uint256(shortToken)));
        
        // bytes32 borrowingFactor = positionStoreUtils.BORROWING_FACTOR();
        // address borrowingFactorAddress = address(uint160(uint256(borrowingFactor)));


        // Constructing the MarketDataState struct to return, this is dummy data
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
