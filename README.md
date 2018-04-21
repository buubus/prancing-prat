# prancing-prat
This is a simple shared wallet construct for Ethereum using Solidity

Once geth is installed and your local test chain has been created you need to run the following commands.

geth --datadir <path_to_mychaindata_folder> --rpc --rpccorsdomain "*"

This command starts the localchain up and beings listener on rpc 

geth attach ipc:<path to IPC file> --unlock 0 --mine 1

This will open an active geth session and start a miner

to open the mist application to deploy a contract 

open -a /Application/Mist.app/Contents/MacOS/Mist --args --rpc <path to ipc file>

 
