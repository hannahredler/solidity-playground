(async () => {
    let accounts = await web3.eth.getAccounts()
    console.log("ABC")
    console.log(accounts)
    console.log(accounts.length)

    let balance = await web3.eth.getBalance(accounts[0])
    console.log("Balance in Wei: " + balance)

    let balanceInEth = web3.utils.fromWei(balance, "ether")
    console.log("Balance in Eth: " + balanceInEth)
})()