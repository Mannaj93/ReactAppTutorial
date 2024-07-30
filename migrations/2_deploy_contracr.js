const DummyToken = artifacts.require("Dummy_Token");
const TetherToken = artifacts.require("Tether");
const StakingDapp = artifacts.require("staking_Dapp");

module.exports = async function(deployer, network, accounts) {
  // Deploy TetherToken
  await deployer.deploy(TetherToken);
  const tetherToken = await TetherToken.deployed();

  // Deploy DummyToken
  await deployer.deploy(DummyToken);
  const dummyToken = await DummyToken.deployed();

  // Deploy StakingDapp with the addresses of the deployed tokens
  await deployer.deploy(StakingDapp, dummyToken.address, tetherToken.address);
  const stakingDapp = await StakingDapp.deployed();

  // Transfer tokens to the StakingDapp contract
  await dummyToken.transfer(stakingDapp.address, '10000000000000000000');
  await tetherToken.transfer(accounts[1], '100000000000000000');
};
