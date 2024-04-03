// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {GMXLensV2} from "../../src/GMXLensV2.sol";

interface IReader {
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

contract GMXLensV2Test is Test {
    GMXLensV2 public lens;
    IReader public reader;
    IOrderStoreUtils public orderStoreUtils;
    IDepositStoreUtils public depositStoreUtils;
    IMarketStoreUtils public marketStoreUtils;
    IPositionStoreUtils public positionStoreUtils;

    struct MarketDataState {
        address marketToken;
        uint256 poolValue;
    }

    function setUp() public {
        lens = new GMXLensV2();
        // Arbitrum contract address https://arbiscan.io/address/0x489ee077994B6658eAfA855C308275EAd8097C4A#code
        reader = IReader(0x489ee077994B6658eAfA855C308275EAd8097C4A);
        orderStoreUtils = IOrderStoreUtils(0x97BeB5A20FBd4596c8B19a89Ec399a100e57d14d);
        depositStoreUtils = IDepositStoreUtils(0x98e86155abf8bCbA566b4a909be8cF4e3F227FAf);
        marketStoreUtils = IMarketStoreUtils(0x5a1344252f0CdfDB765DD5ab97C98734f1D7ED6d);
        positionStoreUtils = IPositionStoreUtils(0x4a57C9b3d6c96954e397Cc186F98fCD2816A95C7);
        // lens.initialize();
    }

    function testGetMarketData() public {

        uint256 poolValue = reader.poolAmounts(0x82aF49447D8a07e3bd95BD0d56f35241523fBab1);
        emit log("poolValue:");
        emit log_uint(poolValue);
        assertTrue(poolValue > 0, "Pool value should be greater than zero");

        bytes32 isLongValue = orderStoreUtils.IS_LONG();
        address isLongAddress = address(uint160(uint256(isLongValue)));
        emit log("longToken:");
        emit log_address(isLongAddress);

        bytes32 initialShortToken = depositStoreUtils.INITIAL_SHORT_TOKEN();
        address initialShortTokenAddress = address(uint160(uint256(initialShortToken)));
        emit log("initialShortTokenAddress:");
        emit log_address(initialShortTokenAddress);


        bytes32 indexToken = marketStoreUtils.INDEX_TOKEN();
        address indexTokenAddress = address(uint160(uint256(indexToken)));
        emit log("indexTokenAddress:");
        emit log_address(indexTokenAddress);

        bytes32 longToken = marketStoreUtils.LONG_TOKEN();
        address longTokenAddress = address(uint160(uint256(longToken)));
        emit log("longTokenAddress:");
        emit log_address(longTokenAddress);
        
        bytes32 shortToken = marketStoreUtils.SHORT_TOKEN();
        address shortTokennAddress = address(uint160(uint256(shortToken)));
        emit log("shortTokennAddress:");
        emit log_address(shortTokennAddress);
        
        bytes32 borrowingFactor = positionStoreUtils.BORROWING_FACTOR();
        address borrowingFactorAddress = address(uint160(uint256(borrowingFactor)));
        emit log("borrowingFactorAddress:");
        emit log_address(borrowingFactorAddress);
    }
}

