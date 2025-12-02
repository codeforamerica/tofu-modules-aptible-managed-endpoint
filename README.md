# Aptible Managed Endpoint Module

[![Main Checks][badge-checks]][code-checks] [![GitHub Release][badge-release]][latest-release]

This module creates a [managed HTTPS endpoint][endpoint] in Aptible. It will
also create the necessary DNS records in Route 53 to verify the domain and
direct it to the endpoint.

## Usage

Add this module to your `main.tf` (or appropriate) file and configure the inputs
to match your desired configuration. For example:

```hcl
module "endpoint" {
  source = "github.com/codeforamerica/tofu-modules-aptible-managed-endpoint?ref=1.2.0"

  aptible_environment = "my-environment"
  aptible_resource    = 12345
  domain              = "my-project.org"
  subdomain           = "www"
  public              = true
}
```

Make sure you re-run `tofu init` after adding the module to your configuration.

```bash
tofu init
tofu plan
```

To update the source for this module, pass `-upgrade` to `tofu init`:

```bash
tofu init -upgrade
```

## Inputs

| Name                | Description                                                                                                   | Type           | Default | Required |
|---------------------|---------------------------------------------------------------------------------------------------------------|----------------|---------|----------|
| aptible_environment | Name of the Aptible environment for the endpoint.                                                             | `string`       | n/a     | yes      |
| aptible_resource    | ID of the resource to attach the endpoint to.                                                                 | `number`       | n/a     | yes      |
| domain              | Top-level domain name for the endpoint. This will be used to find the Route53 zone.                           | `string`       | n/a     | yes      |
| subdomain           | Subdomain for the endpoint. This will be prepended to the domain.                                             | `string`       | n/a     | yes      |
| allowed_cidrs       | An optional lit of CIDRs to allow traffic from (limited to 50 entries).                                       | `list(string)` | `[]`    | no       |
| container_port      | Port on the container to direct traffic to. If not set, defaults to the port defined in the Aptible resource. | `number`       | `null`  | no       |
| public              | Whether the endpoint should be available to the public Internet.                                              | `bool`         | `false` | no       |

## Outputs

| Name     | Description                                         | Type     |
|----------|-----------------------------------------------------|----------|
| id       | ID of the Aptible endpoint.                         | `number` |
| fqdn     | Fully qualified domain name for the HTTPS endpoint. | `string` |
| hostname | Hostname of the endpoint that was created.          | `string` |

[badge-checks]: https://github.com/codeforamerica/tofu-modules-aptible-managed-endpoint/actions/workflows/main.yaml/badge.svg
[badge-release]: https://img.shields.io/github/v/release/codeforamerica/tofu-modules-aptible-managed-endpoint?logo=github&label=Latest%20Release
[code-checks]: https://github.com/codeforamerica/tofu-modules-aptible-managed-endpoint/actions/workflows/main.yaml
[endpoint]: https://www.aptible.com/docs/core-concepts/apps/connecting-to-apps/app-endpoints/https-endpoints/overview
[latest-release]: https://github.com/codeforamerica/tofu-modules-aptible-managed-endpoint/releases/latest
