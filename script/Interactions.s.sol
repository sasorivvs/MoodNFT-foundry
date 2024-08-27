// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);

        mintNftOnCotract(mostRecentlyDeployed);
    }

    function mintNftOnCotract(address basicNft) public {
        vm.startBroadcast();
        BasicNft(basicNft).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);

        mintNftOnCotract(mostRecentlyDeployed);
    }

    function mintNftOnCotract(address moodNft) public {
        vm.startBroadcast();
        MoodNft(moodNft).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipMood(mostRecentlyDeployed, 0);
    }

    function flipMood(address moodNft, uint256 tokenId) public {
        vm.startBroadcast();
        MoodNft(moodNft).flipMood(tokenId);
        vm.stopBroadcast();
    }
}
