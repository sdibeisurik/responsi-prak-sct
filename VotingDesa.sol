// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingDesa {
    address public kepalaDesa;

    struct Proposal {
        string nama;
        uint jumlahVote;
    }

    Proposal[] public proposals;
    mapping(address => bool) public sudahVoting;

    constructor(string[] memory namaProposal) {
        kepalaDesa = msg.sender;
        for (uint i = 0; i < namaProposal.length; i++) {
            proposals.push(Proposal({
                nama: namaProposal[i],
                jumlahVote: 0
            }));
        }
    }

    function vote(uint indexProposal) public {
        require(!sudahVoting[msg.sender], "Anda sudah voting!");
        require(indexProposal < proposals.length, "Proposal tidak valid!");
        sudahVoting[msg.sender] = true;
        proposals[indexProposal].jumlahVote++;
    }

    function lihatProposal(uint index) public view returns (string memory, uint) {
        return (proposals[index].nama, proposals[index].jumlahVote);
    }

    function totalProposal() public view returns (uint) {
        return proposals.length;
    }
}