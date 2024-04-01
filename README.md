# GMX_V2_Lens
GMX V2 Lens data that gather identical information from the GMX V2 stats dashboard

## Commands
- `forge forge init`
- `forge build`
- `forge test`
- `forge script script/DeployGMXLensV2.s.sol --broadcast`
- `forge script script/DeployGMXLensV2.s.sol --broadcast --rpc-url https://sepolia.infura.io/v3/<YOUR_INFURA_PROJECT_ID>`
## Deploy local Smart Contract with anvil
1. - Run `anvil`
2. - Run `forge create GMXLensV2 --interactive` and paste your Private Key
3. You will get somethin like this
   - Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
   - Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
   - Transaction hash: 0x91748b2c624b3cd15fe65539d246945a49ff73bf28f8dd59f623cfbecc7f373