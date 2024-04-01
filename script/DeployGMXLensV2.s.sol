// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {GMXLensV2} from "../src/GMXLensV2.sol";

contract DeployGMXLensV2 is Script {
    function run() external {
        vm.startBroadcast();

        GMXLensV2 lensImpl = new GMXLensV2();
        ERC1967Proxy proxy = new ERC1967Proxy(
            address(lensImpl),
            abi.encodeWithSelector(GMXLensV2.initialize.selector)
        );

        // The rest of your deployment script remains unchanged

        vm.stopBroadcast();
    }
}
