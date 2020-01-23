# SFDC DX GitHub Actions ![Build Status](https://github.com/jefersonchaves/sfdxgithubactions/workflows/CI/badge.svg)
Playground to try-out SFDX with Github Actions

### Protected Branches

Protected Branches are now turned on, `master`can only be pushed/merged to upon a successful CI run.

## How to get going

### Getting a suitable SFDC DX Developer Account

- Sign up for a SFDC Developer Account at https://developer.salesforce.com/promotions/orgs/dx-signup
- Note your username for use later in a GitHub Secret


## Secrets you will need

- **SALESFORCE_DEVHUB_USERNAME**: The username you obtained when you [created your SFDC Developer Account](#getting-a-suitable-sfdc-dx-developer-account)
- **SALESFORCE_CONSUMER_KEY**: The Consumer Key you generated and noted when you created an App on SFDC
- **SALESFORCE_JWT_SECRET_KEY**: The contents of your `server.key` file you created when cerating your self signed certificate, above.
