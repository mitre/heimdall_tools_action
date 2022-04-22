# Heimdall Tools Action is DEPRECATED. Use the [SAF Action](https://github.com/marketplace/actions/saf-cli-action) instead.
THIS ACTION IS DEPRECATED. Use the [SAF Action](https://github.com/marketplace/actions/saf-cli-action) instead.

GitHub Action for [Heimdall Tools](https://github.com/mitre/heimdall_tools)

Easily convert supported formats to Heimdall Data Format for use with Heimdall Enterprise Server, Heimdall Lite, or any other HDF-compatible viewer.


## Input and Output Arguments
### Input
#### `file-to-convert` (Required)

Filename of the file to convert available in the current directory of the action.

#### `converter` (Required)

One of the available converters from Heimdall Tools.

* `fortify_mapper`
* `zap_mapper`
* `burpsuite_mapper`
* `nessus_mapper`
* `snyk_mapper`
* `nikto_mapper`
* `xccdf_results_mapper`
* `jfrog_xray_mapper`
* `dbprotect_mapper`
* `netsparker_mapper`
* `sarif_mapper`
* `scoutsuite_mapper`

### Output

The action will output the converted HDF in the format `heimdall_<converter>.json`. Basic configuration (see the Example section below) would be to consume this file as an output of the GitHub action run.

## Secrets

This action does not use any GitHub secrets at this time.

## Environment Variables

Internally, the action's entrypoint uses the environment variables passed via action inputs. GitHub converts inputs to environment variables by prefixing them with `INPUT_`. Examples: `INPUT_FILE` and `INPUT_CONVERTER`.

## Example

Below is an example action. The idea is that a previous action would have generated the Nikto output (in this case, `nikto.json`) and the Heimdall Tools action will follow up and convert `nikto.json` to `heimdall_nikto.json` in HDF for use with Heimdall Enterprise server or Heimdall Lite.

```
on: [push]
jobs:
  heimdall_tools_conversion:
    runs-on: ubuntu-latest
    name: Heimdall Tools Convert Nikto to HDF
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Convert Nikto
        uses: mitre/heimdall_tools_action@main
        with:
          file: 'nikto.json'
          converter: 'nikto_mapper'
      - name: Artifacts
        uses: actions/upload-artifact@v1
        if: success()
        with:
          name: nikto
          path: heimdall_tools_nikto.json
```

## Contributing, Issues and Support

### Contributing

Please feel free to look through our issues, make a fork and submit _PRs_ and improvements. We love hearing from our end-users and the community and will be happy to engage with you on suggestions, updates, fixes or new capabilities.

### Issues and Support

Please feel free to contact us by **opening an issue** on the issue board, or, at [inspec@mitre.org](mailto:inspec@mitre.org) should you have any suggestions, questions or issues. If you have more general questions about the use of our software or other concerns, please contact us at [opensource@mitre.org](mailto:opensource@mitre.org).

### NOTICE

© 2019-2020 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

### NOTICE

MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA 22102-7539, (703) 983-6000.
