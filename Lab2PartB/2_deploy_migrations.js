// Javascript to deploy MyAdvancedToken.sol
var aliceToken = artifacts.require("./MyAdvancedToken.sol");
module.exports = function(deployer) {
  deployer.deploy(aliceToken,1300, "Alice Coin","AC");
};
