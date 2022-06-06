from eth_account import Account
from scripts.tools import get_account
from brownie import EmployeeData, network, config
from web3 import Web3
import json
from brownie import chain
import time

contract_data = {"mainContract": ""}


def deploy():
    account = get_account()    
    main_contract = EmployeeData.deploy({"from": account})    
    contract_data["mainContract"] = main_contract.address
    save_data()


def save_data():
    with open("./Frontend/recordmanagement/contractData.json", "w") as outfile:
        json.dump(contract_data, outfile)
    main_contract_compiled = json.load(open("./build/contracts/EmployeeData.json"))
    with open("./Frontend/recordmanagement/compiledContract.json", "w") as outfile:
        json.dump(main_contract_compiled, outfile)


def main():
    deploy()
