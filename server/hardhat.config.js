require("@nomiclabs/hardhat-waffle");
require('dotenv').config();


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks : {
    hardhat: {},
    goerli: {
      url: process.env.ALCHEMY_RINKEBY_URL,
      accounts:[process.env.ACCOUNT_PRIVATE_KEY],
    }
  }
};
