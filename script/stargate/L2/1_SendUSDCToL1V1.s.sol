// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "../../../src/stargateTransfer.sol";
import "forge-std/Script.sol";

contract SendUSDCToL1V1 is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        address l2StargateRouter = vm.envAddress("L2_STARGATE_ROUTER");
        address l2UsdcToken = vm.envAddress("L2_USDC");

        uint16 l1ChainEid = uint16(vm.envUint("L1_CHAIN_ID"));
        uint256 l2PoolId = vm.envUint("L2_POOL");
        uint256 l1PoolId = vm.envUint("L1_POOL");

        vm.startBroadcast(privateKey);
        StargateTransfer transferContract = new StargateTransfer(l2StargateRouter);
        IERC20(l2UsdcToken).approve(address(transferContract), type(uint256).max);
        (uint256 estimatedFee, ) = transferContract.getFeesQuote(l1ChainEid, 0xa33E4C926A74059371A932E6AfA1c1c3560Dac35);

        uint256 usdcAmount = 1e6;
        uint256 minAmountToReceive = (usdcAmount * 995) / 1000; // 0.5% slippage buffer

        transferContract.transferToken{value: estimatedFee}(
            l2UsdcToken,
            l1ChainEid,
            l2PoolId,
            l1PoolId,
            usdcAmount,
            0xa33E4C926A74059371A932E6AfA1c1c3560Dac35,
            minAmountToReceive
        );

        vm.stopBroadcast();
    }
}
