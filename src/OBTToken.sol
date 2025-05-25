// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OBTToken is ERC20 {
    constructor(address initialOwner_) ERC20("Ozean Bridge Token", "OBT") {
        _mint(initialOwner_, 1_000_000 * (10 ** decimals()));
    }
}
