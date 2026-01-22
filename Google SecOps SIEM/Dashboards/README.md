# GreyNoise Dashboards for Google SecOps SIEM

This directory contains predefined dashboards that enable security analysts to visualize and monitor GreyNoise Intelligence data within Google SecOps SIEM.

## Overview

After collecting GreyNoise data into Google SecOps, these dashboards provide interactive visualizations for threat intelligence monitoring, indicator analysis, and correlation with events in your environment.

## Import a Dashboard

Follow these steps to import a dashboard into Google SecOps SIEM:

1. Log in to your Google SecOps instance.
2. In the navigation bar, click **Dashboards**.
3. Click **New dashboard** and then select **Import from JSON**. The Import dashboard confirmation dialog appears.
4. Click the **Upload dashboard files** button. The Select file dialog appears. Select the dashboard JSON file. The selected dashboard file will appear in the table.
![Import Dashboards](./Screenshots/Import%20Dashboards.png)
5. Click **Import** to continue importing the dashboard to a personal or shared dashboard.

## Available Dashboards

| **Dashboard Name** | **File** | **Description** |
| --- | --- | --- |
| [Indicator Dashboard](#indicator-dashboard) | `GreyNoise Indicator Dashboard.json` | Detailed view of GreyNoise indicators including classification distribution, top actors, organizations, tags, geographic data, CVE associations, and trend analysis. |
| [Correlation Dashboard](#correlation-dashboard) | `GreyNoise Correlation Dashboard.json` | IOC matches between GreyNoise intelligence and events in your environment with geolocation mapping and investigation capabilities. |

---

# Indicator Dashboard

The Indicator Dashboard provides detailed information about indicators fetched from GreyNoise Intelligence. [Download](./GreyNoise%20Indicator%20Dashboard.json)

![GreyNoise Indicator Dashboard](./Screenshots/Indicator%20Dashboard/GreyNoise%20-%20Indicator%20Dashboard.png)

## Filters

![Filters](./Screenshots/Indicator%20Dashboard/Filters.png)

| Filter Label | Applicable Panels |
| --- | --- |
| **Indicator Active Time** | All Panels |
| **Classification Filter** | All Panels |
| **Country Filter** | All Panels |

---

## Panels

### Unique IP Addresses in GreyNoise

![Unique IP Addresses](./Screenshots/Indicator%20Dashboard/Unique%20IP%20Addresses.png)

**Description:** Count of distinct IPs in GreyNoise threat intelligence.

**Visualization Type:** Single valued chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `graph.metadata.product_entity_id` |

---

### Malicious IP Addresses in GreyNoise

![Malicious IP Addresses](./Screenshots/Indicator%20Dashboard/Malicious%20IP%20Addresses.png)

**Description:** Count of IPs identified as Malicious in GreyNoise threat intelligence.

**Visualization Type:** Single valued chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Suspicious IP Addresses in GreyNoise

![Suspicious IP Addresses](./Screenshots/Indicator%20Dashboard/Suspicious%20IP%20Addresses.png)

**Description:** Count of IPs identified as Suspicious in GreyNoise threat intelligence.

**Visualization Type:** Single valued chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Benign IP Addresses in GreyNoise

![Benign IP Addresses](./Screenshots/Indicator%20Dashboard/Benign%20IP%20Addresses.png)

**Description:** Count of IPs identified as Benign in GreyNoise threat intelligence.

**Visualization Type:** Single valued chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Unknown IP Addresses in GreyNoise

![Unknown IP Addresses](./Screenshots/Indicator%20Dashboard/Unknown%20IP%20Addresses.png)

**Description:** Count of IPs with no definitive classification in GreyNoise threat intelligence.

**Visualization Type:** Single valued chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Indicators by Classification

![Indicators by Classification](./Screenshots/Indicator%20Dashboard/Indicators%20by%20Classification.png)

**Description:** Distribution of indicators by Threat Verdict Unspecified, Malicious, Suspicious & Undetected.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Business Service IP Intelligence

![Business Service IP Intelligence](./Screenshots/Indicator%20Dashboard/Business%20Service%20IP%20Intelligence.png)

**Description:** List of IP addresses identified as Business Services, including service category, trust level, and descriptive context.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `graph.entity.ip` |
| `business_service_intelligence.trust_level` | `graph.metadata.threat.detection_fields["business_service_trust_level"]` |
| `business_service_intelligence.explanation` | `graph.metadata.threat.summary` |
| `business_service_intelligence.last_updated` | `graph.additional.fields["business_service_last_updated"]` |
| `business_service_intelligence.name` | `graph.additional.fields["business_service_name"]` |
| `business_service_intelligence.reference` | `graph.additional.fields["business_service_reference"]` |
| `business_service_intelligence.category` | `graph.metadata.threat.category_details` |
| `business_service_intelligence.found` | `graph.additional.fields["business_service_found"]` |
| `business_service_intelligence.description` | `graph.metadata.description` |

---

### Business Service IPs by Trust Level

![Business Service IPs By Trust Level](./Screenshots/Indicator%20Dashboard/Business%20Service%20IPs%20By%20Trust%20Level.png)

**Description:** Business service IPs segmented by trust levels.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `business_service_intelligence.trust_level` | `graph.metadata.threat.detection_fields["business_service_trust_level"]` |
| `business_service_intelligence.found` | `graph.additional.fields["business_service_found"]` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 Organizations

![Top 10 Organizations](./Screenshots/Indicator%20Dashboard/Top%2010%20Organizations.png)

**Description:** Highlights organizations (ISPs/Hosting Providers) most frequently associated with observed indicators.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.metadata.organization` | `graph.entity.ip_geo_artifact.network.organization_name` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 Actors

![Top 10 Actors](./Screenshots/Indicator%20Dashboard/Top%2010%20Actors.png)

**Description:** Identifies the most frequently observed threat actors across all indicators.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.actor` | `graph.additional.fields["internet_scanner_actor"]` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 Tags

![Top 10 Tags](./Screenshots/Indicator%20Dashboard/Top%2010%20Tags.png)

**Description:** Lists the most common tags associated with observed indicators.

**Visualization Type:** Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.tags[].name` | `graph.entity.artifact.tags` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 ASN

![Top 10 ASNs](./Screenshots/Indicator%20Dashboard/Top%2010%20ASNs.png)

**Description:** Displays the top autonomous system numbers related to indicator activity.

**Visualization Type:** Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.metadata.asn` | `graph.entity.ip_geo_artifact.network.asn` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 Categories

![Top 10 Categories](./Screenshots/Indicator%20Dashboard/Top%2010%20Categories.png)

**Description:** Displays the most prevalent network categories.

**Visualization Type:** Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.metadata.category` | `graph.additional.fields["network_category"]` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 OS

![Top 10 Operating Systems](./Screenshots/Indicator%20Dashboard/Top%2010%20Operating%20Systems.png)

**Description:** Shows the top operating systems identified from indicator metadata.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.metadata.os` | `graph.additional.fields["os"]` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 Business Service Categories

![Top 10 Business Service Categories](./Screenshots/Indicator%20Dashboard/Top%2010%20Business%20Service%20Categories.png)

**Description:** Highlights business service categories most often linked to indicators.

**Visualization Type:** Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `business_service_intelligence.category` | `graph.metadata.threat.category_details` |
| `business_service_intelligence.found` | `graph.additional.fields["business_service_found"]` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Top 10 Source Countries

![Top 10 Source Countries](./Screenshots/Indicator%20Dashboard/Top%2010%20Source%20Countries.png)

**Description:** Shows the top Source Countries linked to Indicators.

**Visualization Type:** Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.metadata.country` | `graph.entity.ip_geo_artifact.location.country_or_region` |
| `ip` | `graph.metadata.product_entity_id` |

---

### IPs Over Time (Ingested Indicators Trend)

![IPs Over Time](./Screenshots/Indicator%20Dashboard/IPs%20Over%20Time.png)

**Description:** Trend of ingested indicators over time by classification.

**Visualization Type:** Grouped Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.last_seen_timestamp` | `graph.metadata.interval.start_time.seconds` |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `ip` | `graph.metadata.product_entity_id` |

---

### Indicator Details (All Ingested IPs)

![Indicator Details (All Ingested IPs)](./Screenshots/Indicator%20Dashboard/Indicator%20Details%20(All%20Ingested%20IPs).png)

**Description:** Recently ingested IP indicators with details.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `graph.entity.ip` |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `business_service_intelligence.explanation` | `graph.metadata.threat.summary` |
| `ip` | `graph.metadata.threat.url_back_to_product` |
| `internet_scanner_intelligence.bot` | `graph.metadata.threat.detection_fields["bot"]` |
| `internet_scanner_intelligence.tor` | `graph.metadata.threat.detection_fields["tor"]` |
| `internet_scanner_intelligence.vpn` | `graph.metadata.threat.detection_fields["vpn"]` |
| `internet_scanner_intelligence.vpn_service` | `graph.metadata.threat.detection_fields["vpn_service"]` |
| `internet_scanner_intelligence.metadata.country` | `graph.entity.ip_geo_artifact.location.country_or_region` |
| `internet_scanner_intelligence.metadata.organization` | `graph.entity.ip_geo_artifact.network.organization_name` |
| `internet_scanner_intelligence.last_seen_timestamp` | `graph.metadata.collected_timestamp.seconds` |
| `business_service_intelligence.found` | `graph.additional.fields["business_service_found"]` |
| `business_service_intelligence.trust_level` | `graph.additional.fields["business_service_trust_level"]` |
| `internet_scanner_intelligence.metadata.asn` | `graph.entity.ip_geo_artifact.network.asn` |
| `internet_scanner_intelligence.actor` | `graph.additional.fields["internet_scanner_actor"]` |
| `internet_scanner_intelligence.cves[]` | `graph.entity.asset.vulnerabilities.cve_id` |

> **Note:** The `url_back_to_product` field links to `https://viz.greynoise.io/ip/${ip}` for direct indicator lookup in GreyNoise.

---

### CVE Distribution

![CVE Distribution](./Screenshots/Indicator%20Dashboard/CVE%20Distribution.png)

**Description:** CVEs associated with observed IPs.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `internet_scanner_intelligence.cves[]` | `graph.entity.asset.vulnerabilities.cve_id` |
| `ip` | `graph.entity.ip` |

---

### Manually Queried Indicator

![Manually Queried Indicators](./Screenshots/Indicator%20Dashboard/Manually%20Queried%20Indicators.png)

**Description:** Displays indicators that were manually investigated by users.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `graph.entity.ip` |
| `internet_scanner_intelligence.classification` | `graph.metadata.threat.threat_verdict` |
| `business_service_intelligence.explanation` | `graph.metadata.threat.summary` |
| `ip` | `graph.metadata.threat.url_back_to_product` |
| `business_service_intelligence.found` | `graph.additional.fields["business_service_found"]` |
| `internet_scanner_intelligence.metadata.country` | `graph.entity.ip_geo_artifact.location.country_or_region` |
| `internet_scanner_intelligence.metadata.organization` | `graph.entity.ip_geo_artifact.network.organization_name` |
| `business_service_intelligence.trust_level` | `graph.metadata.threat.detection_fields["business_service_trust_level"]` |
| `internet_scanner_intelligence.actor` | `graph.additional.fields["internet_scanner_actor"]` |
| `internet_scanner_intelligence.metadata.asn` | `graph.entity.ip_geo_artifact.network.asn` |
| `internet_scanner_intelligence.last_seen_timestamp` | `graph.metadata.collected_timestamp.seconds` |
| `is_live_investigation` | `graph.additional.fields["is_live_investigation"]` |

> **Note:** This panel filters indicators where `is_live_investigation = "true"` to show only manually queried indicators.

---

# Correlation Dashboard

The Correlation Dashboard is designed to identify relationships across indicators and events from other sources. [Download](./GreyNoise%20Correlation%20Dashboard.json)

![GreyNoise Correlation Dashboard](./Screenshots/Correlation%20Dashboard/GreyNoise%20-%20Correlation%20Dashboard.png)

## Filters

| Filter Label | Applicable Panels |
| --- | --- |
| **Indicator Active Time Range** | GreyNoise Unique IOC Matches, Malicious IPs, Suspicious IPs, Benign IPs, Unknown IPs, Total Event Matches, Top 10 IP Indicators, IOC by Classification, IOC Matches Over Time by Category, Top 10 Rarely Seen IP, Top 10 Categories, IOCs Geolocation Overview, Correlation Overview |
| **Classification Filter** | GreyNoise Unique IOC Matches, Malicious IPs, Suspicious IPs, Benign IPs, Unknown IPs, Total Event Matches, Top 10 IP Indicators, IOC by Classification, IOC Matches Over Time by Category, Top 10 Rarely Seen IP, Top 10 Categories, IOCs Geolocation Overview, Correlation Overview |

---

## Panels

### GreyNoise Unique IOC Matches

![GreyNoise Unique IOC Matches](./Screenshots/Correlation%20Dashboard/Unique%20IOC%20Matches.png)

**Description:** Total count of GreyNoise Intelligence IOC matches detected in the environment.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |

---

### Malicious IPs

![Malicious IPs](./Screenshots/Correlation%20Dashboard/Malicious%20IPs.png)

**Description:** Count of IPs classified as malicious by GreyNoise Intelligence.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |

---

### Suspicious IPs

![Suspicious IPs](./Screenshots/Correlation%20Dashboard/Suspicious%20IPs.png)

**Description:** Count of IPs classified as suspicious by GreyNoise Intelligence.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |

---

### Benign IPs

![Benign IPs](./Screenshots/Correlation%20Dashboard/Benign%20IPs.png)

**Description:** Count of IPs classified as benign by GreyNoise Intelligence.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |

---

### Unknown IPs

![Unknown IPs](./Screenshots/Correlation%20Dashboard/Unknown%20IPs.png)

**Description:** Count of IPs classified as unknown by GreyNoise Intelligence.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |

---

### Total Event Matches

![Total Event Matches](./Screenshots/Correlation%20Dashboard/Total%20Event%20Matches.png)

**Description:** Count of distinct IP addresses matched against GreyNoise Intelligence.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field | UDM Field       |
| --------- | --------------- |
| `ip`      | `ioc.ioc_value` |

---

### Event Matches In Last 24 Hours

![Event Matches In Last 24 Hours](./Screenshots/Correlation%20Dashboard/Event%20Matches%20In%20Last%2024%20Hours.png)

**Description:** Count of GreyNoise Intelligence IOC matches detected in the environment in the last 24 hours.

**Visualization Type:** Single Valued Chart

**Field Mappings:**

| Raw Field                                      | UDM Field                                   |
| ---------------------------------------------- | ------------------------------------------- |
| `ip`                                           | `ioc.ioc_value`                             |

---

### Top 10 IP Indicators

![Top 10 IP Indicators](./Screenshots/Correlation%20Dashboard/Top%2010%20IP%20Indicators.png)

**Description:** Table of the 10 most frequently matched IPs from GreyNoise Intelligence with hostname details.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| - | `ioc.asset.hostname` |

---

### IOC by Classification

![IOC By Classification](./Screenshots/Correlation%20Dashboard/IOC%20By%20Classification.png)

**Description:** Pie chart showing GreyNoise Intelligence IOC distribution by classification.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |

---

### IOC Matches Over Time by Category

![IOC Matches Over Time By Category](./Screenshots/Correlation%20Dashboard/IOC%20Matches%20Over%20Time%20By%20Category.png)

**Description:** Bar chart showing GreyNoise Intelligence IOC match trends grouped by category.

**Visualization Type:** Bar Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |
| - | `ioc.day_bucket_seconds` |

---

### Top 10 Rarely Seen IP

![Top 10 Rarely Seen IP](./Screenshots/Correlation%20Dashboard/Top%2010%20Rarely%20Seen%20IP.png)

**Description:** Table of the 10 least frequently matched IPs from GreyNoise Intelligence.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| `ip` | `ioc.ioc_value` |
| - | `ioc.asset.hostname` |

---

### Top 10 Categories

![Top 10 Categories](./Screenshots/Correlation%20Dashboard/Top%2010%20Categories.png)

**Description:** Pie chart visualizing the top 10 IOC categories of GreyNoise Intelligence IOC matches.

**Visualization Type:** Pie Chart

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| - | `ioc.category` |
| `ip` | `ioc.ioc_value` |

---

### IOCs Geolocation Overview

![IOCs GeoLocation Overview](./Screenshots/Correlation%20Dashboard/IOCs%20GeoLocation%20Overview.png)

**Description:** World map plotting the geographic origin of matched GreyNoise Intelligence IOCs.

**Visualization Type:** Map

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| - | `ioc.location.region_coordinates.latitude` |
| - | `ioc.location.region_coordinates.longitude` |
| `ip` | `ioc.ioc_value` |

---

### Correlation Overview

![Correlation Overview](./Screenshots/Correlation%20Dashboard/Correlation%20Overview.png)

**Description:** Comprehensive investigation table displaying GreyNoise Intelligence IOC matches for in-depth analysis.

**Visualization Type:** Table

**Field Mappings:**

| Raw Field | UDM Field |
| --- | --- |
| - | `ioc.day_bucket_seconds` |
| - | `ioc.location.region_coordinates.longitude` |
| - | `ioc.location.region_coordinates.latitude` |
| - | `ioc.location.country_or_region` |
| - | `ioc.asset.hostname` |
| - | `ioc.category` |
| `internet_scanner_intelligence.classification` | `ioc.severity` |
| `ip` | `ioc.ioc_value` |

---

## Field Mapping Notes

> **Note:** In Field Mappings, Raw Field entries shown as - represent UDM fields that are automatically enriched by Google SecOps during IOC correlation when GreyNoise indicators match events in your environment.
