// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MultiCall {
    function multiCall(address[] calldata targets, bytes[] calldata data) external payable returns (bytes[] memory) {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);

        for (uint256 i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].call(data[i]);
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }
}
