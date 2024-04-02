// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {GMXLensV2} from "../../src/GMXLensV2.sol";
import {mockMarketData} from "../mocks/mockMarketData.sol";

contract GMXLensV2Test is Test {
    GMXLensV2 public lens;

    struct MarketDataState {
        address marketToken;
        uint256 poolValue;
    }

    function setUp() public {
        lens = new GMXLensV2();
        // lens.initialize();
    }

    function testGetMarketData() public {
        mockMarketData mockMD = new mockMarketData();
        address marketTokenExpected;
        uint256 poolValueExpected;

        GMXLensV2.MarketDataState memory data = mockMD.getMarketData(address(1), 0x489ee077994B6658eAfA855C308275EAd8097C4A);

        // GMXLensV2.MarketDataState memory data = lens.getMarketData(
        //     0x82aF49447D8a07e3bd95BD0d56f35241523fBab1,
        //     0x489ee077994B6658eAfA855C308275EAd8097C4A
        // );
        emit log("Market Token:");
        emit log_address(data.marketToken);
        emit log("Pool Value:");
        emit log_uint(data.poolValue);

        assertEq(poolValueExpected, data.poolValue);
    }
}

