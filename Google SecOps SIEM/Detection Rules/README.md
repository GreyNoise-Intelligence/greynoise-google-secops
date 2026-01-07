# GreyNoise Intelligence - Detection Rules

This directory contains YARA-L detection rules for automated threat detection and alerting using GreyNoise Intelligence data within Google SecOps SIEM.

## Overview

After collecting GreyNoise data into Google SecOps as entities, these detection rules enable automated correlation between your security events and GreyNoise threat intelligence. Each rule is designed for different threat detection scenarios and generates alerts when malicious or suspicious activity is identified.

## Create & Enable Detection Rule

Follow these steps to deploy a detection rule in Google SecOps SIEM:

1. From Google SecOps SIEM, navigate to **Detection > Rules & Detections**.
2. Go to the **Rules Editor** Tab, click on the **NEW** button.
3. Copy and paste the Rule in editor.
4. Click on **SAVE NEW RULE**.
5. Click on **3 dots** on the top right of the editor.
6. To generate alerts, Enable **Alerting**.
7. Enable **Live Rule** to activate Detection Rule.

## Available Detection Rules

| **Rule Name**                                                                                                                       | **File**                                                                | **Description**                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [GreyNoise Intelligence IP Match](#greynoise-intelligence-ip-match)                                                                 | `greynoise_intelligence_ip_match.yaral`                                 | Detects events where source or principal IP matches a malicious or suspicious IP in GreyNoise intelligence.         |
| [GreyNoise Intelligence Inbound Network Traffic with ASN Context](#greynoise-intelligence-inbound-network-traffic-with-asn-context) | `greynoise_intelligence_inbound_network_traffic_with_asn_context.yaral` | Detects allowed inbound firewall connections from malicious IPs flagged by GreyNoise with correlated ASN context.   |
| [GreyNoise Intelligence Brute Force Attack Detection](#greynoise-intelligence-brute-force-attack-detection)                         | `greynoise_intelligence_brute_force_attack_detection.yaral`             | Detects multiple blocked login attempts from IPs flagged by GreyNoise threat intelligence. |

---

## Detection Rule Details

### GreyNoise Intelligence IP Match

**Description:** Detects events where source or principal IP matches a malicious or suspicious IP in GreyNoise intelligence.

**Use Case:** This rule correlates network events (excluding generic events) against GreyNoise intelligence classification information to detect known malicious and suspicious IPs over a 1-hour window. It triggers when a source or principal IP matches the GreyNoise database.

**Rule:**
[View Rule](./greynoise_intelligence_ip_match.yaral)

**Output Fields:**

| Field                    | Description                                  |
| ------------------------ | -------------------------------------------- |
| `$principal_ip`          | Principal IP addresses involved in the event |
| `$principal_hostname`    | Principal hostnames                          |
| `$principal_user_userid` | Principal user IDs                           |
| `$principal_mac`         | Principal MAC addresses                      |
| `$source_ip`             | Source IP addresses                          |
| `$source_hostname`       | Source hostnames                             |
| `$source_user_userid`    | Source user IDs                              |
| `$source_mac`            | Source MAC addresses                         |
| `$target_ip`             | Target IP addresses                          |
| `$target_hostname`       | Target hostnames                             |
| `$target_user_userid`    | Target user IDs                              |
| `$target_mac`            | Target MAC addresses                         |

---

### GreyNoise Intelligence Inbound Network Traffic with ASN Context

**Description:** Detects allowed inbound firewall connections from malicious IPs flagged by GreyNoise with correlated ASN context.

**Use Case:** This high severity rule detects allowed inbound network connections from IPs classified as malicious by GreyNoise threat intelligence with ASN context over a 1-hour window, using firewall logs only. It triggers when source or principal IPs in network connection events match the GreyNoise IP and correlates their ASN for enhanced attribution.

**Rule:**
[View Rule](./greynoise_intelligence_inbound_network_traffic_with_asn_context.yaral)

**Output Fields:**

| Field                    | Description                                       |
| ------------------------ | ------------------------------------------------- |
| `$principal_ip`          | Principal IP addresses involved in the connection |
| `$principal_hostname`    | Principal hostnames                               |
| `$principal_user_userid` | Principal user IDs                                |
| `$principal_mac`         | Principal MAC addresses                           |
| `$source_ip`             | Source IP addresses                               |
| `$source_hostname`       | Source hostnames                                  |
| `$source_user_userid`    | Source user IDs                                   |
| `$source_mac`            | Source MAC addresses                              |
| `$target_ip`             | Target IP addresses                               |
| `$target_hostname`       | Target hostnames                                  |
| `$target_user_userid`    | Target user IDs                                   |
| `$target_mac`            | Target MAC addresses                              |

---

### GreyNoise Intelligence Brute Force Attack Detection

**Description:** Detects multiple blocked login attempts from IPs flagged by GreyNoise threat intelligence.

**Use Case:** This high severity rule detects brute force login attempts (>5) from IPs flagged by GreyNoise threat intelligence over a 15-minute window. It triggers when blocked login events originate from a source or principal IP in the GreyNoise database.

**Rule:**
[View Rule](./greynoise_intelligence_brute_force_attack_detection.yaral)

**Output Fields:**

| Field                    | Description                                       |
| ------------------------ | ------------------------------------------------- |
| `$principal_ip`          | Principal IP addresses involved in login attempts |
| `$principal_hostname`    | Principal hostnames                               |
| `$principal_user_userid` | Principal user IDs targeted                       |
| `$principal_mac`         | Principal MAC addresses                           |
| `$principal_ip_count`    | Count of principal IP addresses                   |
| `$source_ip`             | Source IP addresses of login attempts             |
| `$source_hostname`       | Source hostnames                                  |
| `$source_user_userid`    | Source user IDs                                   |
| `$source_mac`            | Source MAC addresses                              |
| `$source_ip_count`       | Count of source IP addresses                      |
| `$target_ip`             | Target IP addresses                               |
| `$target_hostname`       | Target hostnames                                  |
| `$target_user_userid`    | Target user IDs                                   |
| `$target_mac`            | Target MAC addresses                              |
