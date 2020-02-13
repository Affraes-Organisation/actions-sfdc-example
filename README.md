Workflow courtesy of https://github.com/jefersonchaves/sfdxgithubactions

#### SFDX DC CLI GitHub Actions
![SFDC DX CI](https://github.com/Affraes-Organisation/actions-sfdc-example/workflows/SFDC%20DX%20CI/badge.svg) ![SFDC DX CD](https://github.com/Affraes-Organisation/actions-sfdc-example/workflows/SFDC%20DX%20CD/badge.svg)

Playground to try-out SFDX with Github Actions

### Protected Branches

This copy of the repository has protected branches turned on, `master`can only be pushed/merged to upon a successful CI run.

:construction: **The following is WORK IN PROGRESS** :construction:

### How to get going

#### Visual Studio Code
<details>
<summary>Install and Setup VSCode</summary>
  
- Obtain and install the latest version of [Visual Studio Code](https://code.visualstudio.com/)
- If you don’t already have version 8 or 11 of the JDK installed, you can install the latest version of the Java 8 JDK from [Java SE Development Kit 8 Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) or the latest version of the Java 11 JDK from [Java SE Development Kit 11 Downloads](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html).
- [Install the Salesforce CLI tools](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm) and the [Salesforce Extension Pack for VSCode](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode).
- In a terminal window, run `sfdx update` to update the tools. The packaged tools had a problem when I orginally installed them that was fixed by running the `sfdx update` command

</details>

#### SFDX

<details><summary>Create a suitable SFDX Developer Account</summary>

- [Sign up](https://developer.salesforce.com/promotions/orgs/dx-signup) for a SFDX Developer Account
- Note your username as you will use it later as the contents of the GitHub Secret `SALESFORCE_DEVHUB_USERNAME`

</details>

<details><summary><a id="create-a-self-signed-certificate">Create a Self Signed Certificate</a></summary>

- The JWT-based authorization flow requires a digital certificate and the private key used to sign the certificate. You upload the digital certificate to the custom connected app that is also required for JWT-based authorization. You can use your own private key and certificate issued by a certification authority. Alternatively, [you can use OpenSSL to create a key and a self-signed digital certificate](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm).
- You will use the contents of the `<FILENAME>.key` file (If you followed the [OpenSSL instructions](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm) it will be the `server.key` file) later as the contents of the GitHub Secret `SALESFORCE_JWT_SECRET_KEY`

</details>

<details><summary>Create an App in SFDX</summary>

- As this workflow uses JWT-based Authetication, you must [create a connected app in your Dev Hub org](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_connected_app.htm).
- The `server.crt` referred to is the file you created in the [Create a Self Signed Certificate](#create-a-self-signed-certificate), section above.
- Make note of the consumer key as you will use it later as the contents of the GitHub Secret `SALESFORCE_CONSUMER_KEY`

</details>

#### Set up your copy of the repository

- [Mirror the repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)
- Clone the mirrored repository
- Open the root folder of the repository in VSCode

#### Test your connection with SFDX from VSCode

To issue commands in VSCode, you can press Command + Shift + P on Mac or Ctrl + Shift + P on Windows to make the command palette appear.

<details><summary>Authorize an Organization</summary>

- Type `SFDX: Authorize an Org` and select that command.
- To accept the default login URL, press Enter/Return.
- Enter an alias such as `VSCodePlayground`.
- Notice that your default browser opens a new Salesforce login window. Log in to your playground using your Developer Account username and password.
- When you are asked to grant access to the connected app, click to allow:
![Allow?](https://res.cloudinary.com/hy4kyit2a/f_auto,fl_lossy,q_70/learn/projects/quickstart-vscode-salesforce/use-vscode-for-salesforce/images/35b7e9cde25290c50977ea8932aa92c3_cjptzm-674000-f-0-s-89846-lck-3-l.png)   
- Close the browser window
- You should see a success message in the output panel in VSCode:
![Hooray!](https://res.cloudinary.com/hy4kyit2a/f_auto,fl_lossy,q_70/learn/projects/quickstart-vscode-salesforce/use-vscode-for-salesforce/images/e79231bf40a1e2a893b8b22f1c72774b_cjptzm-677000-g-0-s-89-iyreg-3-fa.png)

</details>

<details><summary>Create a Scratch Org to run a test.</summary>

- Type `SFDX: Create a Default Scratch Org` and select that command.
- To accept the defaults, press Enter/Return. The only default you may want to consider is the life of the Scratch Org (in Days) The default is 7, but you may prefer less.
- check for a `exit 0` success status in the output panel in VSCode
- The system will now use this created Scratch Org to push code to to run tests.

</details>

<details><summary>Push the Code into the Default Scratch Org.</summary>

- Type `SFDX: Push Source to Default Scratch Org` and select that command.
- check for a `exit 0` success status in the output panel in VSCode

</details>

<details><summary>Run the test.</summary>

- Type `SFDX: Invoke Apex Tests` and select that command.
- You can choose a specific test class or run them all.
- check for a `exit 0` success status in the output panel in VSCode

</details>

<details><summary>(Optional) Delete the Scratch Org.</summary>

- The Org will auto delete after the number of days you picked for the life of the Scratch Org when creating it.
- There is no built in SFDX command to do this in the Supplied VSCode Salesforce Extension commands, however, if you head to the terminal panel in VSCode, you can issue the command `sfdx force:org:delete`
- Confirm that you want to mark the Scratch Org for deletion by entering `y` at the prompt

</details>

#### Finish repository setup


<details><summary>Set up the secrets you will need</summary>

Create the following secrets in your copy of the repository:

- `SALESFORCE_DEVHUB_USERNAME`: The username you obtained when you [created your SFDC Developer Account](#getting-a-suitable-sfdc-dx-developer-account)
- `SALESFORCE_JWT_SECRET_KEY`: The contents of your `server.key` file you created when [creating your self signed certificate](#create-a-self-signed-certificate), noted above.
- `SALESFORCE_CONSUMER_KEY`: The Consumer Key you generated and noted when you [created an App in SFDC](#create-an-app-in-sfdx).

</details>

<details><summary>Trigger a CI Build</summary>

- Trigger a CI build so we get a `SFDC_DX_Build_and_Test` Status Check checkbox to select when we setup up Protected Branches.

</details>

<details><summary>Protect the Master Branch</summary>

Set up `master` as a protected branch:
- [x] Require status checks to pass before merging
- [x] Require branches to be up to date before merging
- Status checks found in the last week for this repository:

  - [x] SFDC_DX_Build_and_Test
- [x] Include administrators

</details>

#### Demo
In GitHub Web UI:
- Create a new branch
- Make a change to `force-app/main/default/classes/HelloWorld.cls` that will break the test `force-app/main/default/classes/HelloWorldTest.cls`
- Commit the change
- Open a PR to merge that branch into `master`
- Observe and show CI results (should fail at the `Run Apex test` step in the `SFDC_DX_Build_and_Test` job in `.github/workflows/ci.yml`)
- Observe PR will not allow merge to `master`.

In VSCode:

To issue commands in VSCode, you can press Command + Shift + P on Mac or Ctrl + Shift + P on Windows to make the command palette appear.
- Type `SFDX: Open Default Org` and select that command.
- This will take you to SFDC in your web browser
- Select Setup from the Settings Menu in the top right corner of the web page
- This will take you to the Home Page of the Set up app. You may see your classes in the "Most Recently Used" section on the page, or you can use the Search box in the left column to search for "Apex Classes"
  - Either way show the updated code of the HelloWorld and HelloWorldTest classes.
  - If the Classes do not appear to exist that is ok, it is likely you have not deployed to this org yet. Point this out.
- Switch back to VSCode  
- Pull and fetch to update the local copy of the repository
- Switch to the PR branch created :point_up_2:
- Make the change to `force-app/main/default/classes/HelloWorld.cls` that will fix the test `force-app/main/default/classes/HelloWorldTest.cls`
- (Optional) perform a local test using the steps followed in [Test your connection with SFDX from VSCode](#test-your-connection-with-sfdx-from-vscode)
- Commit the change
- Push to Github

In GitHub Web UI:
- Go to the PR
- Observe and show CI results (should now pass the `SFDC_DX_Build_and_Test` job in `.github/workflows/ci.yml`)
- Observe PR will now allow merge to `master`.
- Merge
- Go to the Actions Tab - note that the `SFDC DX CD` Action is now running to deploy the code.
- (Optional) Delete your PR branch both on GitHub and in your local copy

In VSCode:

To issue commands in VSCode, you can press Command + Shift + P on Mac or Ctrl + Shift + P on Windows to make the command palette appear.
- Type `SFDX: Open Default Org` and select that command.
- This will take you to SFDC
- Select Setup from the Settings Menu in the top right corner of the web page
- This will take you to the Home Page of the Set up app. You may see your classes in the "Most Recently Used" section on the page, or you can use the Search box in the left column to search for "Apex Classes"
  - Either way show the updated code of the HelloWorld and HelloWorldTest classes.

