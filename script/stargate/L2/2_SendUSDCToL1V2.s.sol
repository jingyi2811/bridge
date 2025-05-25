// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import { IStargate } from "../../../src/interfaces/IStargate.sol";
import "../../../src/stargateTransferV2.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SendUSDCToL1V2 is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address senderAddress = vm.addr(privateKey);

        address stargatePoolAddress = vm.envAddress("L2_STARGATE_POOL_USDC");
        address usdcTokenAddress = vm.envAddress("L2_USDC");
        uint32 destinationEid = uint32(vm.envUint("L1_EID"));
        uint256 usdcAmount = 1e6;

        vm.startBroadcast(privateKey);

        StargateIntegration integration = new StargateIntegration();

        IERC20(usdcTokenAddress).approve(stargatePoolAddress, usdcAmount);

        (uint256 valueToSend, SendParam memory sendParam, MessagingFee memory messagingFee) =
                            integration.prepareTakeTaxi(stargatePoolAddress, destinationEid, usdcAmount, senderAddress);

        IStargate(stargatePoolAddress).sendToken{ value: valueToSend }(
            sendParam,
            messagingFee,
            senderAddress
        );

        vm.stopBroadcast();
    }
}
