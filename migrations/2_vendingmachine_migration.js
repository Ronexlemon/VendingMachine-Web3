const vendingmachine = artifacts.require("vendingmachine");

module.exports = function (deployer) {
  deployer.deploy(vendingmachine);
};
