import { ethers } from "hardhat";

async function main() {

  const Ifo = await ethers.getContractFactory("IFO");
  const ifo = await Ifo.deploy();

  await ifo.deployed();

  console.log(`IFO deployed to ${ifo.address}`);

  const Energy = await ethers.getContractFactory("Energy");
  const energy = await Energy.deploy();

  await energy.deployed();

  console.log(`IFO deployed to ${energy.address}`);  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
