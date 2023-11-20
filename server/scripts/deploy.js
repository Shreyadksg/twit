const main = async() => {
  const contractFactory = await ethers.getContractFactory("twitContract");
  const contract = await contractFactory.deploy();
  await contract.deployed();

  console.log("Contract deployed to: ", contract.address);
}

const runMain= async() => {
  try{
    await main();
    process.exit(0);
  }
   catch(error){
    console.log(error);
    process.exit(1);
   }
}

runMain();
//contract address   0x29897320b998A6FC1B755998647d9463c158df12