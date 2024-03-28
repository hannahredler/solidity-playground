const abi = [
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "address",
				"name": "_from",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "address",
				"name": "_to",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "_amount",
				"type": "uint256"
			}
		],
		"name": "TokensSent",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_amount",
				"type": "uint256"
			}
		],
		"name": "sendToken",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "tokenBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
const contract = "0x1AFB5A35eedcB18b810f0d7Fa9A12673d0D173bF"
// let accounts;
// let web3;

async function enableDapp() {

  if (typeof window.ethereum !== 'undefined') {
    console.log("Window.ethereum", window.ethereum)
    try {
      accounts = await ethereum.request({
        method: 'eth_requestAccounts'
      });
      web3 = new Web3(window.ethereum);
      console.log( "Account: " + accounts[0]);

    //   listenToEventsButton.removeAttribute("disabled");
    //   contractAddr.removeAttribute("disabled");
    } catch (error) {
      if (error.code === 4001) {
        // EIP-1193 userRejectedRequest error
        console.log( "Error: Need permission to access MetaMAsk");
        console.log('Permissions needed to continue.');
      } else {
        console.error(error.message);
      }
    }
  } else {
    console.log("Error: Need to install MetaMask");
  }
};

async function listenToEvents() {
    let contractInstance = new web3.eth.Contract(abi, contract);

    console.log("Geting past events")
    contractInstance.getPastEvents("TokensSent",{fromBlock:0 }).then(event => {
        
        console.log("PAST EVENTS:", event)
    });

    contractInstance.events.TokensSent().on("data", (event) => {
        console.log("In listener")
        console.log("HERE AN EVEEEENTS", JSON.stringify(event))
  });
}

console.log("READY")
enableDapp()
listenToEvents()