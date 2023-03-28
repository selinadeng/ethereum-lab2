## Spring 2023 Developin Blockchain Use Cases                         
### Carnegie Mellon University                   
### Due: 11:59 PM Monday, April 10, 2023                               
### 20 Points
### Lab Assistance provided by Michael McCarthy, Atharva Joshi, and Nikita Vignesh Kumar
### See Office Hours on Piazza


**Learning Objectives:** The objectives of this lab are to familiarize the student

with some important Ethereum tools and to develop a detailed understanding

of an ERC20 token contract. ERC20 is a standard interface that is used by a wide variety 
of decentralized finance (DeFi) contracts.

We will be reviewing the ERC20 contract in class.


## Lab2 Outline



Part A. Interacting with Ganache using the World Wide Web and Remix


Part B. Truffle deployment and interaction with an ERC20 Token contract.


Part C. Remix deployment and interaction with an ERC20 Token contract


## Part A. Interacting with Ganache using the World Wide Web and Remix 5 Points

This lab exercise is, essentially, a client server application. Ganache is
the server and is used to hold a single instance blockchain. We
will visit the server with two clients - the Remix application
running in a browser and our own browser based application.


1) In Lab 1, you installed Ganache and you will be using it again here.
   Run Ganache Quickstart and leave it running for the remainder of Part A.




2) We will be using the Remix IDE to compile Solidity source code. We will also

   use Remix to deploy byte code to Ganache and interact with the contract.

   Remix runs in your browser. You don't need to install it.


   Visit https://remix.ethereum.org/
 and run Remix in the same browser where you installed your Metamask wallet.

   The Metamask wallet was installed in step 2 of Lab 1.


3) In Remix, choose Solidity and create a new file named "NameValue.sol". Be careful to choose a compiler version that is supported by the code ( solidity >=0.4.22 <0.6.0 )

4) [Paste this code to NameValue.sol](../../blob/master/Lab2PartA/NameValue.sol)


5) In Remix, click on "Compile NameValue.sol" on the left sidebar.  Once compilation
   is complete, view the ABI. The ABI or Application Binary Interface is a
   machine readable description of the public features of the contract. With this
   machine readable description, the right tools can assist in making calls on the remote procedure. You might also take a peek at the bytecode. This is the code that we want to deploy to Ganache. It is the compiled Solidity code.

6) Click the "Deploy and run transactions" icon on the left sidebar. The default environment is set to "Javascript VM". The NameValue.sol contract can be tested in Remix using the Javascript VM environment. However, the Javascript VM environment is only used for local testing.  In this lab we will be using a Web3 Provider that allows us to connect to a running node. In this case, we want to connect to Ganache.

7) In Remix, visit the Environment selection box and choose "Ganache Provider". You will be prompted with an "External Node Request" box. Your Ganache Provider Endpoint is http://localhost:7545. See the Ganache user interface and verify the port (7545) is correct. A Web3 Provider knows how to talk to a running node.

8) In the next step, the Solidity contract will be deployed to Ganache.

9) Click on the Deploy button. Note how the first account in Ganache has
spent a little Eth. It costs money to deploy a contract. Notice too, on Ganache, the Transactions tab shows a contract creation transaction. By clicking on the transaction itself, you can see the hash of the transaction, the bytecode of the contract, and other details regarding the costs of things.

10) In Remix, under "Deployed Contracts",
 "NameValue" will be listed. Expand that node and expand the setValues
 node (you have to drill down) and you will be able to get and set values within your contract.
 Try it using Remix. Use the Transact button to set several name value pairs and "getValues" to get the last values back.
Look at the cost (in gas used) that a "set" operation requires. Also, note the call on "get" is not a transaction at all - it's a "call", and it costs nothing to execute. The idea is that a "call" only interacts with a single Ethereum node. A transaction, on the other hand, requests that all nodes on the peer to peer network change their state.

11) Notice, under "Deployed Contracts" in Remix, the contract has an address. That address should match the Created Contracts address shown under Transactions in Ganache.

Our next task is to visit the contract with a web page.

12) The command "truffle init" requires that it runs in an empty directory.
Make an empty directory named Lab2PartA and enter the following three commands:
```
   truffle init
   npm init      take the suggested defaults
   npm install dotenv truffle-wallet-provider ethereumjs-wallet
```

13) Within the directory named Lab2PartA, create a file named index.html and [copy the code found here.](../../blob/master/Lab2PartA/index.html)


14) Within the directory named Lab2PartA, create a file named index.css and [copy the code found here.](../../blob/master/Lab2PartA/index.css)


15) Within the HTML file, we need to point to your deployed contract on Ganache.
   In Remix, you will see "Deployed Contracts". Just below the "Deploy Contracts"
   box, you will see "NameValues" listed. Click on the copyboard icon and paste
   the contract address in your HTML at the line:
```

   var Values = ValueContract.at('PASTE CONTRACT ADDRESS HERE');

```
16) Click on index.html on your system and you should get a simple user interface
to interact with the contract deployed on your local Ganache blockchain. You can enter a name and a value that you want to send and store in the contract. You can view the last transaction by clicking the "Get Last Transaction (call)" button.

Check on Ganache and see if it is registering the transactions.

:checkered_flag:**To receive credit for Part A, submit a screen shot of your browser showing
that the last transaction had the name of your andrew ID and the value of 100.
This screen shot will be contained in a Word document or PDF with the name
Lab2PartA.doc or Lab2PartA.pdf.**


## Part B. Truffle deployment and interaction with an ERC20 Token 10 Points


[Before beginning this part, take some time and study the ERC20 token contract
 here.](../../blob/master/Lab2PartB/MyAdvancedToken.sol)

Look over each method and read the documentation. The documentation is
 meant to be instructional and is aimed at helping you to complete this part.

Within each method, there is code that will help you interact with the
 deployed contract from within the truffle console.

You will deploy this contract using the same steps that you used in lab 1 part 3. You will need to change names when appropriate. Revisit the Lab 1 Part 3 instructions. Be sure to configure Ganache by

1) creating a new Workspace when Ganache starts up
and by
2) including the truffle-config.js file (as you did in lab 1, part 3).


There is one significant difference in this deployment. The MyAdvancedToken contract has a constructor that is passed arguments. So, we will use [this file for 2_deploy_migrations.js.](../../blob/master/Lab2PartB/2_deploy_migrations.js)


Follow these steps before deployment: 
1. Replace pragma solidity … statement with pragma solidity 0.5.1;
2. Right click anywhere on the code in the MyAdvancedToken.sol file. 
3. Click the “Solidity: Change workspace compiler version (Remote)” option. 
4. Change your compiler version to 0.5.1
5. Next, go into your truffle-config.js file and change your solc compiler to 0.5.1
   It should look a little something like this: 
   compilers: {
       solc: {
         version: "0.5.1", 
       }
     },
 6. All the errors should be gone 

Notice the data that we are passing to the constructor upon deployment.

Once deployed, you will need to answer the following questions by using

the truffle console.

:checkered_flag:**Before beginning, see the checkered flag below that describes how to submit Part B.**


Truffle Problems



In the problems below, Alice, Bob, Charlie, Donna and Emily are associated
 with the Ganache accounts account[0], account[1], account[2], account[3]
 and account[4] respectively. Each begins with 100 ether in his or her account.
 Using web3.eth.accounts, set all of these names to the corresponding addresses, e.g.,
```
Alice = web3.eth.accounts[0]

```

0. Alice has deployed an instance of the MyAdvancedToken contract to
 Ganache. She gave it the name "Alice Coin" and the symbol AC and an initial
 supply of 1300 tokens.
 Show two commands, that when executed in the truffle console, display the number of tokens (Alice Coins) held in her account. Also show the value (number of tokens) displayed by the second command. For this question you are required to call the balanceOf() method on the contract.

1. Show two commands, that when executed in the truffle console, display the total supply of tokens. For this question you are required to access the totalSupply public variable.

2. Alice would like to know her balance in Ethereum. Show the Truffle console commands that will retrieve and display her Ethereum balance.


3. Alice allows Bob to spend 100 tokens on her behalf. Show the
 truffle console command and the transaction receipt.
 Also, show Alice's Ethereum balance after she runs the transaction.

4. Step number 3 should have generated an event on Ganache. Show the three values of _owner, _spender, and _value that are available under the Events tab.

5. Alice allows Charlie to spend 50 tokens on her behalf. Show the
 truffle console command and the transaction receipt.


6. Show two commands, that when executed in the truffle console, display the number of tokens that Alice has in her account. Also, show the number of tokens displayed by the second command (her token balance). Use the balanceOf() method.

7. Bob sends 50 of Alice's tokens to Donna. Show the
 truffle console command and the transaction receipt.
 Also, show Bob's Ethereum balance after he runs the transaction.


8. Charlie sends 20 of Alice's tokens to Emily and burns the
 remaining tokens that Alice provided to Charlie. Show the
 truffle console commands and the transaction receipts.


9. Show the command needed to access the totalSupply variable and show the number of tokens remaining.

10. Emily sends 5 of her tokens to Bob. Paste here the
 truffle console command and the transaction receipt.
 Also, show Bob's token balance after Emily runs the transaction.


11. Bob sends his 5 tokens to Alice. Paste here the
 truffle console command and the transaction receipt.



12. Bob returns his remaining allowance to Alice. Show the
 truffle console command and the transaction receipt.
 Also, show Bob's token balance after he runs the transaction.


13. Bob attempts to send 10 tokens to Donna. Show the
 truffle console command and the transaction receipt or any errors
 that may occur.



14. Alice sends 100 tokens to the contract without increasing
 the totalSupply. She also sets the buy price to 1 ether and the
 sell price to 2 ether. Paste here the truffle console commands and the transaction receipts.


15. Show the command to query the contract's ether balance (not the token balance). Also, show the ether balance.


16. Donna buys 50 ether worth of tokens. Show the
 truffle console command and the transaction receipt.


17. Donna no longer enjoys her tokens and wants to sell as many as she can back to the contract. Show the command she uses to sell her tokens and show the returned receipt.


18. Alice wants to have her contract "live free". So, she turns over control of the contract to the contract itself. Show the command she uses to free her contract and show the returned receipt.

19. Alice decides that she wants to mint 5 additional tokens and give them to Bob (increasing the total supply of tokens by 5). Show the command that she would try to use and show any error that may result.


20. Find the token balance of each of our players:

    Alice _________

    Bob   _________

    Charlie _______

    Donna _________

    Emily _________

    contract ______


21. What is the ether balance of
 each of our players:

    Alice _________

    Bob   _________

    Charlie _______

    Donna _________

    Emily _________

    contract ______    

:checkered_flag:**To receive credit for Part B, submit your answers to the 22 questions above in a file named Lab2PartB.doc or Lab2PartB.pdf. Each answer will be clearly labelled with the question number (0 through 21).**

## Part C. Remix deployment and interaction with an ERC20 Token 5 Points



In this Part, you will deploy the same MyAdvancedToken contract to Ganache using Remix.

Once deployed, you will need to answer the following questions by using
 Remix. Paste your solutions into Lab2PartC.doc or Lab2PartC.pdf.


Remix Problems
:


In the problems below, Alice, Bob, Charlie, Donna and Emily are associated
 with the Ganache accounts account[0], account[1], account[2], account[3]
 and account[4] respectively. Each has 100 ether in their accounts.

0. Alice deploys an instance of the MyAdvancedToken contract to
 Ganache. She gives it the name "Alice Coin" and the symbol "AC" and an initial supply of 1300 tokens.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Alice's address.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt returned to the browser.


1. Alice allows Bob to spend 100 tokens on her behalf.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Bob's address.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs returned to the browser.

2. Alice allows Charlie to spend 50 tokens on her behalf.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Charlie's address.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs.

3. Bob sends 50 of Alice's tokens to Donna.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Donna's address.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs.


4. Charlie sends 20 of Alice's tokens to Emily and burns the
 remaining tokens that Alice provided to Charlie.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Emily's address.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the first transaction receipt logs.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the second transaction receipt logs.


5. Emily sends 5 of her tokens to Bob.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs.



6. Bob sends his 5 tokens to Alice.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs.


7. Bob returns his remaining allowance to Alice.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs.


8. Bob attempts to send 10 tokens to Donna.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the error message.



9. Alice sends 100 tokens to the contract without increasing
 the totalSupply. She also sets the buy price to 1 ether and the
 sell price to 2 ether.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the first transaction receipt logs.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the second transaction receipt logs.


10. Donna buys 50 ether worth of tokens.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show the transaction receipt logs.


11. Find the token balance of each of our players:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alice

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bob

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Charlie

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Donna

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Emily  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contract  


12. What is the ether balance (to two decimal digits) for:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alice

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bob

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Charlie

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Donna

13. Alice turns control of the contract to the contract itself. What is
the transaction hash?


14. What is the Elliptic curve private key of Alice?


15. Public key cryptography often uses digital certificates. However,
in this lab, we have made no use of digital certificates. Explain why. In your answer,
be sure to say what digital certificates are normally used for and then explain why we do not
need them here.


:checkered_flag:**To receive credit for Part C, submit your answers to the 16 questions above in a file named Lab2PartC.doc or Lab2PartC.pdf. Each answer will be clearly labelled with the question number (0 through 15). Each answer will be nicely formatted and easy to read.**


:checkered_flag:**Place your three submission documents (Lab2PartA.doc or Lab2PartA.pdf and Lab2PartB.doc or Lab2PartB.pdf and Lab2PartC.doc or Lab2PartC.pdf) into a single directory and zip that directory. Name the zip file <your-andrew-id>Lab2.zip. Submit this single zip file to Canvas.**


## Grading rubric for the materials in the submission directory
One zip file named Lab2.zip will be submitted on Canvas for grading.

+ 4 points for successful completion of Part A
+ 1 point for correct submission and clear labelings of Part A
+ 9 points for successful completion of Part B
+ 1 point for correct submission and clear labelings of Part B
+ 4 points for successful completion of Part C
+ 1 point for correct submission and clear labelings of Part C

Penalty for any late  work
==========================
+ -1 point per day late


## FAQ's

### When I do `web3.isConnected()`, it gives `false`. What do I do?

Ensure that Ganache is up before running `truffle console`. This is a common issue,
and can be remediated by restarting `truffle console`.

### My Balances from truffle console and Ganache UI don't match up. What gives?

https://web3js.readthedocs.io/en/v1.2.11/web3-eth.html#id49
