//NameValue.sol

 pragma solidity >=0.4.22 <0.6.0;

 contract NameValue {

    string name;

    uint value;

 function setValues(string memory _name, uint _value) public {

   name = _name;

   value = _value;

 }

 function getValues() public view returns (string memory , uint) {

   return ( name, value);

 }

}
