# SFDX GitHub Actions ![Build Status](https://github.com/jefersonchaves/sfdxgithubactions/workflows/CI/badge.svg)
Playground to try-out SFDX with Github Actions

### Protected Branches

This copy of the repository has protected branches turned on, `master`can only be pushed/merged to upon a successful CI run.

:construction: **The following is WORK IN PROGRESS** :construction:

### How to get going

#### Visual Studio Code
- Obtain and install the latest version of [Visual Studio Code](https://code.visualstudio.com/)
- If you don’t already have version 8 or 11 of the JDK installed, you can install the latest version of the Java 8 JDK from [Java SE Development Kit 8 Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) or the latest version of the Java 11 JDK from [Java SE Development Kit 11 Downloads](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html).
- [Install the Salesforce CLI tools](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm) and the [Salesforce Extension Pack for VSCode](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode).
- In a terminal window, run `sfdx update` to update the tools. The packaged tools had a problem when I orginally installed them that was fixed by running the `sfdx update` command

#### SFDX

##### Create a suitable SFDX Developer Account

- [Sign up](https://developer.salesforce.com/promotions/orgs/dx-signup) for a SFDX Developer Account
- Note your username as you will use it later as the contents of the GitHub Secret `SALESFORCE_DEVHUB_USERNAME`

##### Create a Self Signed Certificate
- The JWT-based authorization flow requires a digital certificate and the private key used to sign the certificate. You upload the digital certificate to the custom connected app that is also required for JWT-based authorization. You can use your own private key and certificate issued by a certification authority. Alternatively, [you can use OpenSSL to create a key and a self-signed digital certificate](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm).
- You will use the contents of the `<FILENAME>.key` file (If you followed the [OpenSSL instructions](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm) it wiull be the `server.key` file) later as the contents of the GitHub Secret `SALESFORCE_JWT_SECRET_KEY`

##### Create an App in SFDX

- As this workflow uses JWT-based Authetication, you must [create a connected app in your Dev Hub org](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_connected_app.htm).
- The `server.crt` referred to is the file you created in the [Create a Self Signed Certificate](#create-a-self-signed-certificate).
- Make note of the consumer key as you will use it later as the contents of the GitHub Secret `SALESFORCE_CONSUMER_KEY`

#### Set up your copy of the repository

- [Mirror the repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)
- Clone the mirrored repository
- Open the root folder of the repository in VSCode
- Test your connection with SFDX:
  -

##### Secrets you will need

Create the following secrets in your copy of the repository:

- `SALESFORCE_DEVHUB_USERNAME`: The username you obtained when you [created your SFDC Developer Account](#getting-a-suitable-sfdc-dx-developer-account)
- `SALESFORCE_JWT_SECRET_KEY`: The contents of your `server.key` file you created when [creating your self signed certificate](#create-a-self-signed-certificate), noted above.
- `SALESFORCE_CONSUMER_KEY`: The Consumer Key you generated and noted when you [created an App in SFDC](#create-an-app-in-sfdx).
