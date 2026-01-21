# GreyNoise Google SecOps Playbooks

This repository contains sample playbooks that use the **GreyNoise** integration in **Google SecOps SOAR** platform. These playbooks automate incident response procedures with predefined actions using GreyNoise threat intelligence data, enabling rapid and comprehensive insights for security events and network operations.

These automated playbooks can be used as a reference to generate a custom workflow to fulfill your needs.

## Import Playbooks

Importing a playbook into any SecOps instance is straightforward:

- To import all GreyNoise Playbooks and Blocks, you can download the [All Playbook Bundle](<./GreyNoise - All Sample Playbooks & Blocks.zip>). Alternatively, you can selectively import specific playbooks and blocks by downloading them individually from the [Playbooks](#playbooks) and [Blocks](#blocks) sections.

- Open the SecOps instance. From the sidebar, navigate to **Response > Playbooks** section.
    ![Sidebar - Playbooks](<./screenshots/Playbook Section.png>)

- Click on the **three dots** icon at the top of the Playbooks, and then click on **Import**.
  ![Import Playbook](<./screenshots/Import Playbook.png>)

- Select the `.zip` file downloaded earlier.

The playbooks stored in the file would be imported. We can access these under the **Imported Playbooks** folder. These playbooks and blocks can be moved to any other folder of your choice.

**Important:** Before using any playbook with an alert, review its default settings (triggers, action parameters, etc.) to ensure they align with your needs.

---

## Prerequisites

Apart from GreyNoise the following additional integrations and Power Ups must be configured in your Google SecOps SOAR instance before using these playbooks:

### **Integrations** (Install from Content Hub > Response Integrations)

- **[Zscaler](https://docs.cloud.google.com/chronicle/docs/soar/marketplace-integrations/zscaler)** - Required for network containment playbooks that block/unblock IP addresses
- **[Siemplify](https://docs.cloud.google.com/chronicle/docs/soar/marketplace-integrations/siemplify)** - Built-in tools for case management, entity creation, and workflow control

**Installation Steps:**
1. Navigate to **Content Hub > Response Integrations** in your SecOps instance
2. Search for the integration name (e.g. "Zscaler")
3. Click **Install** and follow the configuration wizard
4. [Configure the integration](https://docs.cloud.google.com/chronicle/docs/soar/respond/integrations-setup/supporting-multiple-instances#configure-an-instance) instance with required credentials/settings

For detailed instructions: [Install an Integration](https://docs.cloud.google.com/chronicle/docs/soar/respond/integrations-setup/configure-integrations#install-an-integration)

### **Power Ups** (Install from Content Hub > Power Ups)


- **[Functions](https://docs.cloud.google.com/chronicle/docs/soar/marketplace-and-integrations/power-ups/functions)** - Built-in utility functions for data processing (JSON Path queries, string manipulation, etc.)
- **[Tools](https://docs.cloud.google.com/chronicle/docs/soar/marketplace/power-ups/tools)** - A set of utility actions for data manipulation to power up playbook capabilities (Change Case Name, Attach Playbook, etc.)

**Installation Steps:**

1. Navigate to **Content Hub > Power Ups** in your SecOps instance
2. Search for "Functions" and "Tools"
3. Click **Install** for each Power Up
4. [Configure the Power Ups](https://docs.cloud.google.com/chronicle/docs/soar/respond/integrations-setup/supporting-multiple-instances#configure-an-instance) instance (No credentials required)

---

## Documentation

- [Playbooks](#playbooks)
  - [Noise Elimination](#noise-elimination)
  - [Network Containment Based on GreyNoise IP Feed](#network-containment-based-on-greynoise-ip-feed)
  - [Dynamic Case Naming from Webhook](#dynamic-case-naming-from-webhook)
  - [CVE-Based Network Containment Orchestrator](#cve-based-network-containment-orchestrator)
- [Blocks](#blocks)
  - [Network Containment Block](#network-containment-block)

---

## Playbooks

Playbooks are a feature in Google Security Operations (SecOps) that can be used to automatically perform actions on alerts/cases when triggered. Playbooks can be used to: Retrieve information about alerts, Remediate threats, Create tickets, and Manage toxic combinations and IAM recommendations.

**Points to Note:**

- Each playbook requires a trigger, which decides when the playbook would be run. Users can update the Trigger conditions based on the requirements.
- The imported playbooks are disabled by default. Users can easily enable any playbook by simply clicking on the toggle button beside the playbook name. ([Reference](https://cloud.google.com/chronicle/docs/soar/respond/working-with-playbooks/whats-on-the-playbooks-screen#:~:text=At%20the%20top%20segment%20of%20the%20playbook%20designer%20pane%2C%20you%20can%20use%20the%20horizontal%20toggling%20button%20to%20enable%20or%20disable%20the%20playbook.))
- Imported playbooks are set to **All Environments** by default
- You can move playbooks to a specific folder or duplicate them to your specific environment as needed
- Review and update trigger conditions to match your environment's alert sources
- Verify all integration instances referenced in playbook actions are available in your environment
- Test playbooks in Simulator mode before enabling it for use

### Noise Elimination

This playbook updates the priority level of an Alert based on GreyNoise reputation data for IP addresses. [Download](<./Noise Elimination - GreyNoise.zip>)

![Playbook - Noise Elimination](<./screenshots/playbooks/Noise Elimination.png>)

**Trigger**:

- This playbook is triggered on alerts containing **ADDRESS** type entities (IP addresses).

**Flow**:

- GreyNoise - Quick IP Lookup (action)
  - This action queries GreyNoise API to enrich IP entities with classification, trust level, and threat intelligence data.

- Determine Alert Priority from IP Intelligence (condition)
  - This condition evaluates the GreyNoise classification (`Entity.GN_classification`, `Event.new_state.classification`, or `Event.new_state`) to determine the appropriate alert priority level.
  - **Branches**: Malicious, Suspicious, Benign, Default

- Siemplify - Change Alert Priority (action)
  - This action maps the GreyNoise classification to alert priority levels based on the condition evaluation.

**Priority Mapping:**

| GreyNoise Classification | Alert Priority |
|-------------------------|----------------|
| malicious               | High          |
| suspicious              | Medium        |
| benign                  | Low           |
| unknown                 | Unchanged     |
| (unseen)                | Unchanged     |

---

### Network Containment Based on GreyNoise IP Feed

This playbook blocks or unblocks IP on Firewall based on the GreyNoise IP feed ingested via Webhook. [Download](<./Network Containment Based on GreyNoise IP Feed - GreyNoise.zip>)

![Playbook - Network Containment Based on GreyNoise IP Feed](<./screenshots/playbooks/Network Containment Based on GreyNoise IP Feed.png>)

**Trigger**:

- This playbook is triggered on alerts where `Event.event_type` equals **"IP Classification Change"** or **"ip-classification-change"** (ingested by the GreyNoise Webhook Connector).

**Flow**:

- Siemplify - Create Entity (action)
  - This action creates an `ADDRESS` Entity from the GreyNoise Feed which will be utilized by the Zscaler actions.

- Evaluate IP Classification (condition)
  - This condition evaluates the IP classification status (`Event.new_state.classification` or `Event.new_state`) from the GreyNoise feed to determine whether to block or unblock the IP address.
  - **Branches**:
    - **Malicious or Suspicious**: Routes to blacklist action
    - **Benign**: Routes to whitelist action
    - **Default**: No action

- Zscaler - Add To Blacklist (action)
  - This action blocks the collected IP Address from the GreyNoise IP Classification change Feed when classified as malicious.

- Zscaler - Add To Whitelist (action)
  - This action unblocks the collected IP Address from the GreyNoise IP Classification change Feed when classification changes to benign.

---

### Dynamic Case Naming from Webhook

This playbook dynamically renames cases based on alert/event data received via GreyNoise webhook to overcome webhook naming limitations. [Download](<./Dynamic Case Naming from Webhook - GreyNoise.zip>)

![Playbook - Dynamic Case Naming from Webhook](<./screenshots/playbooks/Dynamic Case Naming from Webhook.png>)

**Trigger**:

- This playbook is triggered on alerts where `Alert.Product` equals **"GreyNoise-Alert"** or **"GreyNoise-Feed"** (ingested by the GreyNoise Webhook Connector).

**Note:** To enable automatic playbook attachment, ensure the `DeviceProduct` field is correctly mapped during webhook configuration as described in the [Webhook Setup Guide](<../Webhooks/README.md>).

**Use Case**:

This playbook dynamically renames cases based on alert/event data received via GreyNoise webhook to overcome webhook naming limitations. It evaluates the alert type (IP Alert, CVE Change, or IP Classification Change) and applies the appropriate case naming format. Optionally attaches the Noise Elimination playbook to the alert for automated threat analysis and response workflows.

**Flow**:

- Identify Alert Type (condition)
  - This condition evaluates the alert source and available event data to determine the appropriate case naming pattern.
  - **Branches**:
    - **GreyNoise Alerts**: When `Alert.Product` equals "GreyNoise-Alert"
    - **GreyNoise Feed CVE Change**: When `Event.cve` is not empty
    - **GreyNoise Feed IP Classification Change**: When `Event.ip` is not empty
    - **Default**: Fallback branch

- Tools - Change Case Name (action)
  - This action dynamically updates the case name using values extracted from alert/event fields to provide meaningful case identification. Three different naming formats are applied:
    - **IP Alert Format:** `[Product]: [EventName] IP [ip] [classification]`
    - **CVE Activity Format:** `[Product]: [EventName] [cve] new activity - [activity_seen]`
    - **IP State Change Format:** `[Product]: [EventName] IP [ip] [new_state] Detected`

- Tools - Attach Playbook (action)
  - This action attaches the "[GreyNoise - Noise Elimination](#noise-elimination)" playbook to automatically enrich and analyze entities in the alert for threat intelligence assessment.

**Note:** This playbook resolves the webhook limitation where case names cannot be dynamically set during webhook ingestion. It ensures meaningful case titles are created based on the specific alert context and automatically triggers follow-up analysis workflows. Users could attach custom playbook workflows to the webhook generated alerts using the Tools - Attach Playbook action.

---

### CVE-Based Network Containment Orchestrator

This playbook orchestrates automated network containment by iterating through CVE entities in alerts and invoking the Network Containment Block for each CVE. [Download](<./CVE-Based Network Containment Orchestrator - GreyNoise.zip>)

![Playbook - CVE-Based Network Containment Orchestrator](<./screenshots/playbooks/CVE-Based Network Containment Orchestrator.png>)

**Trigger**:

- This playbook is triggered on alerts containing **CVE** type entities.

**Use Case**:

This playbook orchestrates automated network containment by iterating through CVE entities in alerts and invoking the Network Containment Block for each CVE. It queries GreyNoise for malicious IPs associated with CVEs and triggers containment actions via integrated security tools like Zscaler or Fortigate.

**Flow**:

- Siemplify - For Each Loop (action)
  - This action iterates through all CVE entities present in the alert to process each CVE identifier individually.

- [Network Containment Block](#network-containment-block) (block)
  - This block is invoked for each CVE entity to query GreyNoise and block associated malicious IPs.
  
**Note:** This playbook wraps the Network Containment Block functionality into an automated orchestrator that processes multiple CVE entities in a single alert, eliminating the need for manual block attachment.

---

## Blocks

### Network Containment Block

This reusable block automates the process of identifying and blocking malicious IP addresses associated with specific CVEs using GreyNoise intelligence. [Download](<./Network Containment Block - GreyNoise.zip>)

### Use Case

This block retrieves IP addresses from GreyNoise associated with a specific CVE. To narrow down the query, it allows filtering based on GreyNoise IP classification and last seen date, and also allows the user to limit the total result count to fit in the limitations of some firewalls. The identified IPs are then automatically blocked using the configured firewall or security device (such as Zscaler).

### Inputs

- **Enter a CVE Identifier** - The CVE identifier to query (e.g., CVE-2021-27320). This is the vulnerability identifier for which you want to find associated malicious IPs.
- **Maximum IP Count** - Maximum number of IP addresses to retrieve (e.g., 100). This helps limit the result set to fit firewall capacity constraints.
- **Time Filter** - Time-based filter for last seen activity (e.g., last_seen:1d). This narrows results to recently active IPs.
- **Classification Filter** - GreyNoise classification filter (e.g., (classification:malicious OR classification:suspicious)). This filters IPs based on their threat classification.

### Flow

- **GreyNoise - Execute GNQL Query (action)**
  - This action executes a GNQL query against the GreyNoise API to retrieve malicious IPs associated with the specified CVE identifier using the classification and time filters provided.

- **Data Processing Steps (actions)**
  - Multiple intermediate actions are used to extract and format the IP addresses from the GreyNoise API JSON response. The actions extract IP addresses using JSONPath, clean formatting characters, and prepare a comma-separated list suitable for entity creation using the Function - Power Ups.

- **Siemplify - Create Entity (action)**
  - This action creates suspicious IP address entities in the alert to enable entity-based security actions.

- **Zscaler - Add To Blacklist (action)**
  - This action blocks suspicious/malicious IP addresses in Zscaler using the newly created IP entities from the alert.

**Note:** As we need multiple user inputs to be added before execution, we have created this as a block which can be manually attached to an alert or reused with any existing playbook. Users could create a separate playbook and use this block to perform the Network Containment use case.

![Block - Network Containment Block](<./screenshots/blocks/Network Containment Block.png>)

---

## Troubleshooting

In case of any failures when running any playbook, we can debug the same by running the playbook in the Simulator Mode. For more details, please refer to this guide: [Google SecOps playbooks - Simulator](https://cloud.google.com/chronicle/docs/soar/respond/working-with-playbooks/working-with-playbook-simulator).

---

## References

- [GreyNoise Documentation](https://docs.greynoise.io/)
- [Google SecOps Playbooks Documentation](https://cloud.google.com/chronicle/docs/secops/google-secops-soar-toc#work-with-playbooks)

---

For questions or support, please contact your GreyNoise or Google SecOps administrator.
