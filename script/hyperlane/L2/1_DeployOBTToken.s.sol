// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "../../../src/OBTToken.sol";
import {Script, console} from "forge-std/Script.sol";

contract DeployOBTToken is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address initialOwner = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);
        OBTToken obtToken = new OBTToken(initialOwner);
        vm.stopBroadcast();

        console.log("OBTToken deployed to:", address(obtToken));
    }
}
