
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract WillThrow {

    error NotAllowedError(string);

    function aFunction() public pure {
        // require(false, "Failed!");
        // assert(false);
        revert NotAllowedError("Not allowed");
    }
}

contract ErrorHandling {

    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLowLevelData(bytes lowLevelData);

    function catchTheError() public{

        WillThrow willthrow = new WillThrow();

        try willthrow.aFunction() {
            // if it works
        } catch Error(string memory reason) { // catches requires
            // if it doesnt
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) { // catches wrong assertions
            emit ErrorLogCode(errorCode);
        } catch (bytes memory lowLevelData) { // catches anything else
            emit ErrorLowLevelData(lowLevelData);
        }
    }
}