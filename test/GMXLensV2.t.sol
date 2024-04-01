// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GMXLensV2} from "../src/GMXLensV2.sol";

contract GMXLensV2Test is Test {
    GMXLensV2 public lens;

    function setUp() public {
        lens = new GMXLensV2();
        lens.initialize();
    }

    function testGetMarketData() public {
        // Write your test logic to test the `getMarketData` function
    }
}

