# GreyNoise Intelligence - Google SecOps SIEM Components

This directory contains the Google SecOps SIEM components for the GreyNoise Intelligence integration.

## Prerequisites

Before using these components, ensure GreyNoise data is being ingested into Google SecOps SIEM.

> 📥 **Ingestion Script**: Visit the [Chronicle Ingestion Scripts Repository](https://github.com/chronicle/ingestion-scripts/greynoise).

## Components

| Component | Description | Documentation |
| --- | --- | --- |
| [Detection Rules](./Detection%20Rules/) | YARA-L rules for automated threat detection and alerting | [Detection Rules Guide](./Detection%20Rules/README.md) |
| [Saved Searches](./Saved%20Searches/) | Predefined UDM queries for indicator investigation | [Saved Searches Guide](./Saved%20Searches/README.md) |
| [Dashboards](./Dashboards/) | Interactive dashboards for threat intelligence monitoring and visualization | [Dashboards Guide](./Dashboards/README.md) |

---

## Detection Rules

Navigate to [`Detection Rules/`](./Detection%20Rules/) for YARA-L detection rules.

See the [Detection Rules README](./Detection%20Rules/README.md) for detailed documentation.

### Quick Reference

| Rule                                                                                                                                                             | Purpose                                                                                                            |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| **[GreyNoise Intelligence IP Match](./Detection%20Rules/greynoise_intelligence_ip_match.yaral)**                                                                 | Detects events where source or principal IP matches a malicious or suspicious IP in GreyNoise intelligence         |
| **[GreyNoise Intelligence Inbound Network Traffic with ASN Context](./Detection%20Rules/greynoise_intelligence_inbound_network_traffic_with_asn_context.yaral)** | Detects allowed inbound firewall connections from malicious IPs flagged by GreyNoise with correlated ASN context   |
| **[GreyNoise Intelligence Brute Force Attack Detection](./Detection%20Rules/greynoise_intelligence_brute_force_attack_detection.yaral)**                         | Detects multiple blocked login attempts from IPs flagged by GreyNoise threat intelligence |

---

## Saved Searches

Navigate to [`Saved Searches/`](./Saved%20Searches/) for predefined UDM queries.

See the [Saved Searches README](./Saved%20Searches/README.md) for detailed documentation.

### Quick Reference

| Search | Purpose |
| --- | --- |
| **[GreyNoise - IP Risk & Vulnerability Details](./Saved%20Searches/GreyNoise%20-%20IP%20Risk%20%26%20Vulnerability%20Details.yaral)** | Classification, anonymization signals, CVEs, activity timeline |
| **[GreyNoise - Indicator Context Summary](./Saved%20Searches/GreyNoise%20-%20Indicator%20Context%20Summary.yaral)** | Actor attribution, geo details, organization, tags |
| **[GreyNoise - High Risk Indicators](./Saved%20Searches/GreyNoise%20-%20High%20Risk%20Indicators.yaral)** | Filter for MALICIOUS or SUSPICIOUS indicators |
| **[GreyNoise - All Indicator Lookup](./Saved%20Searches/GreyNoise%20-%20All%20Indicator%20Lookup.yaral)** | Browse all indicators for ad-hoc investigations |

---

## Dashboards

Navigate to [`Dashboards/`](./Dashboards/) for dashboard JSON files.

### Import Dashboard

1. Log in to your Google SecOps instance.
2. In the navigation bar, click **Dashboards**.
3. Click **New dashboard** and then select **Import from JSON**. The Import dashboard confirmation dialog appears.
4. Click the **Upload dashboard files** button. The Select file dialog appears. Select the dashboard JSON file. The selected dashboard file will appear in the table.
![Import Dashboards](./Dashboards/Screenshots/Import%20Dashboards.png)
5. Click **Import** to continue importing the dashboard to a personal or shared dashboard.

### Available Dashboards

| Dashboard | Description |
| --- | --- |
| **[Indicator Dashboard](./Dashboards/GreyNoise%20Indicator%20Dashboard.json)** | Detailed view of GreyNoise indicators including classification distribution, top actors, organizations, tags, geographic data, CVE associations, and trend analysis |
| **[Correlation Dashboard](./Dashboards/GreyNoise%20Correlation%20Dashboard.json)** | IOC matches between GreyNoise intelligence and events in your environment with geolocation mapping and investigation capabilities |

---

## View Ingested Data

To verify GreyNoise data is being ingested:

1. Log in to Google SecOps.
2. Navigate to **Investigation > SIEM Search**.
3. Run the following UDM query:

```
metadata.log_type = "GREYNOISE"
```
