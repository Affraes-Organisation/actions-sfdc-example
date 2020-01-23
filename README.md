# SFDX GitHub Actions ![Build Status](https://github.com/jefersonchaves/sfdxgithubactions/workflows/CI/badge.svg)
Playground to try-out SFDX with Github Actions

### Protected Branches

Protected Branches are now turned on, `master`can only be pushed/merged to upon a successful CI run.

## How to get going

### Getting a suitable SFDX Developer Account

- [Sign up](https://developer.salesforce.com/promotions/orgs/dx-signup) for a SFDX Developer Account
- Note your username as you will use it later as the contents of the GitHub Secret `SALESFORCE_DEVHUB_USERNAME`

### Create a Self Signed Certificate
- The JWT-based authorization flow requires a digital certificate and the private key used to sign the certificate. You upload the digital certificate to the custom connected app that is also required for JWT-based authorization. You can use your own private key and certificate issued by a certification authority. Alternatively, [you can use OpenSSL to create a key and a self-signed digital certificate](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm).
- You will use the contents of the `<FILENAME>.key` file (If you followed the [OpenSSL instructions](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm) it wiull be the `server.key` file) later as the contents of the GitHub Secret `SALESFORCE_JWT_SECRET_KEY`

### Create an App in SFDX

- As this workflow uses JWT-based Authetication, you must [create a connected app in your Dev Hub org](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_connected_app.htm).
- The `server.crt` referred to is the file you created in the [Create a Self Signed Certificate](#create-a-self-signed-certificate).
- Make note of the consumer key as you will use it later as the contents of the GitHub Secret `SALESFORCE_CONSUMER_KEY`

## Secrets you will need

Create the following secrets in your copy of the repository:

- `SALESFORCE_DEVHUB_USERNAME`: The username you obtained when you [created your SFDC Developer Account](#getting-a-suitable-sfdc-dx-developer-account)
- `SALESFORCE_JWT_SECRET_KEY`: The contents of your `server.key` file you created when [creating your self signed certificate](#create-a-self-signed-certificate), noted above.
- `SALESFORCE_CONSUMER_KEY`: The Consumer Key you generated and noted when you [created an App in SFDC](#create-an-app-in-sfdx).
