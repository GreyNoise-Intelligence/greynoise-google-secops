# GreyNoise Saved Searches for Google SecOps SIEM

This directory contains predefined saved searches that enable security analysts to quickly query and analyze GreyNoise Intelligence data within Google SecOps SIEM.

## Overview

After collecting GreyNoise data into Google SecOps as entities, these saved searches allow you to view specific indicators through predefined UDM queries. Each search is designed for different security analysis use cases.

## Create & Execute a Saved Search

Follow these steps to create and run a saved search in Google SecOps SIEM:

1. From Google SecOps SIEM, navigate to **Investigation > SIEM Search**.
2. Go to **Search Manager**, click on the **+** icon.
3. Copy and paste the Search Query in **UDM SEARCH**, Title in **Title**, and Description in **Description** from the searches listed below.
4. Click on **SAVE EDITS**.
5. Click on **LOAD SEARCH**.
6. Select **Time Range**.
7. Click on **Run Search** to execute the search query.


## Available Saved Searches

| **Search Name** | **File** | **Description** |
| --- | --- | --- |
| [GreyNoise - IP Risk & Vulnerability Details](#greynoise---ip-risk--vulnerability-details) | `GreyNoise - IP Risk & Vulnerability Details.yaral` | Comprehensive security view with classification, anonymization signals, CVEs, and activity timeline. |
| [GreyNoise - Indicator Context Summary](#greynoise---indicator-context-summary) | `GreyNoise - Indicator Context Summary.yaral` | Actor attribution, geographic details, organization info, and tags for contextual analysis. |
| [GreyNoise - High Risk Indicators](#greynoise---high-risk-indicators) | `GreyNoise - High Risk Indicators.yaral` | Quick filter for MALICIOUS or SUSPICIOUS indicators requiring immediate investigation. |
| [GreyNoise - All Indicator Lookup](#greynoise---all-indicator-lookup) | `GreyNoise - All Indicator Lookup.yaral` | Browse all ingested GreyNoise indicators for ad-hoc investigations. |

---

## Saved Search Details

### GreyNoise - IP Risk & Vulnerability Details

**Description:** Comprehensive security view of GreyNoise indicators including classification, anonymization signals, associated CVEs, and activity timeline.

**Use Case:** Use this search to identify IP addresses with known vulnerabilities and assess their risk profile based on GreyNoise classification and anonymization characteristics (Bot, Tor, VPN, Spoofable).

**Query:**
[View Query](./GreyNoise%20-%20IP%20Risk%20%26%20Vulnerability%20Details.yaral)

**Output Fields:**

| Field | Description |
| --- | --- |
| `$ip` | IP address of the indicator |
| `$classification` | GreyNoise threat verdict (MALICIOUS, SUSPICIOUS, BENIGN, UNKNOWN) |
| `$category` | Network category of the IP |
| `$bot` | Whether the IP is identified as a bot |
| `$tor` | Whether the IP is a Tor exit node |
| `$vpn_Service` | VPN service name if applicable |
| `$spoofable` | Whether the IP source can be spoofed |
| `$first_seen_date` | Date when the IP was first observed |
| `$all_cves` | Associated CVE identifiers |
| `$last_seen` | Most recent observation timestamp |

---

### GreyNoise - Indicator Context Summary

**Description:** Provides actor attribution, geographic details, organization info, and tags for quick indicator triage and contextual analysis.

**Use Case:** Use this search for rapid triage of indicators by viewing actor information, geographic origin, organization ownership, and associated tags to understand the context behind observed activity.

**Query:**
[View Query](./GreyNoise%20-%20Indicator%20Context%20Summary.yaral)

**Output Fields:**

| Field | Description |
| --- | --- |
| `$ip` | IP address of the indicator |
| `$classification` | GreyNoise threat verdict |
| `$description` | Human-readable description of the indicator |
| `$summary` | Threat summary information |
| `$actor` | Internet scanner actor attribution |
| `$country` | Geographic country/region of the IP |
| `$organization` | Organization that owns the IP |
| `$category` | Network category |
| `$first_seen_date` | Date when the IP was first observed |
| `$last_seen` | Most recent observation timestamp |
| `$primary_tag` | Associated GreyNoise tags |

---

### GreyNoise - High Risk Indicators

**Description:** Lookup filter to quickly identify indicators classified as MALICIOUS or SUSPICIOUS that require immediate investigation.

**Use Case:** Use this search as a priority filter during incident response to focus on high-risk indicators that need immediate attention.

**Query:**
[View Query](./GreyNoise%20-%20High%20Risk%20Indicators.yaral)

**Output Fields:**

| Field | Description |
| --- | --- |
| All entity fields | Returns all GreyNoise indicator data with MALICIOUS and SUSPICIOUS classification |

---

### GreyNoise - All Indicator Lookup

**Description:** Browse all ingested GreyNoise indicators with business service context. Use as a starting point for ad-hoc investigations.

**Use Case:** Use this search as a general-purpose lookup to browse all GreyNoise indicators in your environment and start ad-hoc investigations.

**Query:**
[View Query](./GreyNoise%20-%20All%20Indicator%20Lookup.yaral)

**Output Fields:**

| Field | Description |
| --- | --- |
| All entity fields | Returns all GreyNoise indicator data with business service context |