//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.16;

contract crud {

    struct Player{
        string name;
        uint64 goals;
    }
    string c = "deleted successfully";
    Player[] private players;
    uint256 public totalPlayers;

    function insertPlayer(string memory name, uint64 goals) public returns(uint){
        Player memory newPlayer = Player(name, goals);
        players.push(newPlayer);
        totalPlayers++;
        return totalPlayers;
    }

    /*function putPlayer(string memory name, uint64 goals) public returns(uint){
        Player memory newPlayer = Player(name, goals);
        players.push(newPlayer);
        totalPlayers++;
        return totalPlayers;
    }*/



    function updatePlayerGoals(string memory _name, uint64 _goals) public returns(uint){
        for(uint i = 0 ; i < totalPlayers ; i++){
            if(compareStrings(players[i].name,_name)){
                players[i].goals = _goals;
                string memory name = _name;
                uint64 goals = _goals;
            }
        }
        return _goals;
    }

    function getPlayerInfo(string memory _name)public view returns(uint64 goals){
        for(uint i = 0 ; i < totalPlayers ; i++){
            if(keccak256(abi.encodePacked(players[i].name)) == keccak256(abi.encodePacked(_name))){
                return (players[i].goals);
            }
        }
    }

    function removePlayer(string memory _name) public returns (uint, string memory){
        for(uint i = 0 ; i < totalPlayers ; i++){
            if(compareStrings(players[i].name, _name)){
                delete players[i];
                totalPlayers--;
                return (players.length, c);
            }
        }
    }

    function compareStrings(string memory a, string memory b)internal pure returns(bool){
       return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}