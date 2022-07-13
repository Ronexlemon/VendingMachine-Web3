//require solidity contract
const vendingmachine = artifacts.require("vendingmachine");
contract("vendingmachine",(accounts) =>{
    before(async () =>{
        instance = await vendingmachine.deployed()
    })
    it("checking the initial balance of the vending machine is 100;",async()=>{
        let balance = await instance.getvendingmachinebalance()
        assert.equal(balance,100,"initial balance should be 100")
    })
    it("ensure balance of the vending machine can be updated",async()=>{
        await  instance.restock(100)
        let balance = await instance.getvendingmachinebalance()
        assert.equal(balance,200)

    })
})