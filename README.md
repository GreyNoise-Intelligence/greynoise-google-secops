<!-- markdownlint-disable MD041 -->
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Lint](https://github.com/GreyNoise-Intelligence/greynoise-google-secops/actions/workflows/lint.yaml/badge.svg)](https://github.com/GreyNoise-Intelligence/greynoise-google-secops/actions/workflows/lint.yaml)

# GreyNoise Intelligence - Google SecOps Integration

This repository contains the Google SecOps components for the GreyNoise Intelligence integration,
including SIEM dashboards, saved searches, detection rules, and SOAR playbooks for comprehensive
threat intelligence visualization, investigation, and automated response.

---

# Google SecOps

## SIEM Integration

### Repository Contents

| Component           | Description                                               | Path                                                                                 |
| ------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| **Detection Rules** | YARA-L rules for automated threat detection               | [`Google SecOps SIEM/Detection Rules/`](./Google%20SecOps%20SIEM/Detection%20Rules/) |
| **Saved Searches**  | Predefined UDM queries for indicator investigation        | [`Google SecOps SIEM/Saved Searches/`](./Google%20SecOps%20SIEM/Saved%20Searches/)   |
| **Dashboards**      | Interactive dashboards for threat intelligence monitoring | [`Google SecOps SIEM/Dashboards/`](./Google%20SecOps%20SIEM/Dashboards/)             |

> 📖 For detailed SIEM Integration Information, see the [Google SecOps SIEM](./Google%20SecOps%20SIEM/README.md).

## SOAR Integration

### Repository Contents

| Component           | Description                                               | Path                                                                                 |
| ------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| **Playbooks**       | Automated response playbooks and reusable blocks          | [`Google SecOps SOAR/Playbooks/`](./Google%20SecOps%20SOAR/Playbooks/)             |
| **Webhooks**        | Webhook configurations for alerts and feeds ingestion     | [`Google SecOps SOAR/Webhooks/`](./Google%20SecOps%20SOAR/Webhooks/)               |

> 📖 For detailed SOAR Integration Information, see:
> - [Playbooks Documentation](./Google%20SecOps%20SOAR/Playbooks/README.md)
> - [Webhooks Documentation](./Google%20SecOps%20SOAR/Webhooks/README.md)

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct,
and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available,
see the [tags on this repository](https://github.com/GreyNoise-Intelligence/greynoise-google-secops/tags).

## Links

* [GreyNoise.io](https://greynoise.io)
* [GreyNoise Terms](https://greynoise.io/terms)
* [GreyNoise Developer Portal](https://docs.greynoise.io)

## Contact Us

Have any questions or comments about GreyNoise? Contact us at [integrations@greynoise.io](mailto:integrations@greynoise.io)

## Copyright and License

Code released under [MIT License](LICENSE).
