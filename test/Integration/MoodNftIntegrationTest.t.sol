// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    DeployMoodNft deployer;

    address public USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        //console.log(moodNft.tokenURI(0));
    }

    function testFlipToSadMoodWorks() public {
        vm.startPrank(USER);
        moodNft.mintNft();
        moodNft.flipMood(0);
        //console.log(moodNft.tokenURI(0));
        assert(moodNft.checkMood(0) == MoodNft.Mood.SAD);
    }
}
