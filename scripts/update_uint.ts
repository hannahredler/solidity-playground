(async() => {
    const address = "0xA13645EdEaC241c226F2170bbb9F43Ba7A363193"
    const abiArray = [
        {
            "inputs": [],
            "name": "myUint",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "uint256",
                    "name": "_myUint",
                    "type": "uint256"
                }
            ],
            "name": "updateUint",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ]
    console.log("HERE")

    const contractInstance =  new web3.eth.Contract(abiArray, address)
    console.log("MyUint: ", await contractInstance.methods.myUint().call())

    const accounts = await web3.eth.getAccounts()
    console.log("Accounts: ", accounts, accounts[0])
    
    const txResult = await contractInstance.methods.updateUint(345).send({from: accounts[0]}) //.setMyUint(2).send({from: accounts[0]})
    console.log("txResult: ",  txResult)

    console.log("MyUint after setting: ", await contractInstance.methods.myUint().call())


})()