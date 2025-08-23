require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");


/** @type import('hardhat/config').HardhatUserConfig */
/* const ACH_URL = process.env.ACH_URL;
const ACH_PASSWORD = process.env.ACH_PASSWORD;
const I = process.env.I;
const P = process.env.P;
const _B = process.env.B;
const B = process.env.B;
const E = process.env.E;
const D = process.env.D;
const Q = process.env.Q;
const F = process.env.F;
const M = process.env.M;
const B_ = process.env.B; 
const _P = process.env.P; 
const _Y = process.env.Y; */

module.exports = {
  defaultNetwork: 'hardhat',
  solidity: {
   compilers: [
    {
      version: "0.8.0",
      settings: {
        optimizer: {
          enabled: true
        }
      }
    }, 
       {
      version: "0.8.7",
      settings: {
        optimizer: {
          enabled: true
        }
      }
    },
       {
      version: "0.8.19",
      settings: {
        optimizer: {
          enabled: true
        }
      }
    },
       {
      version: "0.8.20",
      settings: {
        optimizer: {
          enabled: true
        }
      }
    }
   ]
},
   networks: {
  sepolia: {
  url: 'https://eth-mainnet.g.alchemy.com/v2/CtjK_Hd4KM8HgJCSDGPYE',
  accounts:{
     mnemonic: 'illegal palm battle become erosion donkey quarter fiscal much blouse point youth',
     path: "m/44'/60'/0'/0/0", 
     initialIndex: 0, 
     count: 1
  },
  chainId: 11155111,
 }, 
 hardhat: {
   allowUnlimitedContractSize: true
 }    
   }, 
  paths: {
    artifacts: './artifacts',
    cache: './cache',
    sources: './contracts',
    contractaddress: './cont//ract-address.json'
  },
  ignition: { // config on the module method for the deployment 
    blockPollnningInterval: 1_000, // The time in milliseconds that Hardhat Ignition will wait between checks that a new block has been minted.
    timeBeforeBumpingFees: 3 * 60 * 1_000, // The time in milliseconds to wait before bumping the fee for an unconfirmed transaction.
    maxFeeBumps: 4, // The number of times an unconfirmed transaction will have its fee bumped before Hardhat Ignition considers it timed out.
    requiredConfirmations: 5, // The number of confirmations Hardhat Ignition waits before considering a transaction as complete. This provides control over block re-org risk.
    disableFeeBumping: false, // telling hardhat ignition not to bump in unconfirmed transaction
  },
  sourcify: {
    enabled: false
  },
  etherscan: {
    apiKey: 'JR8B6IKD929EDNMH92EMSFG591GHV18DXJ'  
   }, 
   gasReporter: {
    enabled: true,
    curreny: "USD",
    outputFile: "gasReport.txt",
    noColors: true,
    // coinMarketCap
  },
  mocha: {
    timeout: 200000, // 200 millseconds
  }
}