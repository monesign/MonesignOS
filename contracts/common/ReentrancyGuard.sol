/*
 * SPDX-License-Identitifer:    MIT
 */

pragma solidity ^0.4.24;

import "../common/UnstructuredStorage.sol";


contract ReentrancyGuard {
    using UnstructuredStorage for bytes32;

    bytes32 private constant REENTRANCY_MUTEX_POSITION = 0xe855346402235fdd185c890e68d2c4ecad599b88587635ee285bce2fda58dacb;

    string private constant ERROR_REENTRANT = "REENTRANCY_REENTRANT_CALL";

    modifier nonReentrant() {

        require(!REENTRANCY_MUTEX_POSITION.getStorageBool(), ERROR_REENTRANT);


        REENTRANCY_MUTEX_POSITION.setStorageBool(true);

        _;

        REENTRANCY_MUTEX_POSITION.setStorageBool(false);
    }
}
