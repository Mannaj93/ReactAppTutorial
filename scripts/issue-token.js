const stakingDapp = artifacts.require('staking_dapp.sol')

module.exports = async function(callback)
{
    let staking_Dapp = await stakingDapp.deployed()
    await stakingDapp.issuedummy()

    console.log("dummy token issue")
    callback()
    
}