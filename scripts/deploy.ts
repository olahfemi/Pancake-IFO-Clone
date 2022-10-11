import { ethers } from "hardhat";

async function main() {

  const Ifo = await ethers.getContractFactory("IFO");
  const ifo = await Ifo.deploy();

  await ifo.deployed();

  console.log(`IFO deployed to ${ifo.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
