# GreyNoise Google SecOps Playbooks

This repository contains sample playbooks that uses the **GreyNoise** integration in **Google SecOps SOAR** platform. These playbooks automate incident response procedures with predefined actions using GreyNoise threat intelligence data, enabling rapid and comprehensive insights for security events and network operations.

These automated playbooks can be used as a reference to generate a custom workflow to fulfill your needs.


## Import Playbooks

Importing a playbook into any SecOps instance is straightforward:

- Download the `.zip` file of the playbook that needs to be imported. Each playbook listed in the [Playbooks](#playbooks) section below has a **Download** button for easy access. 

- Open the SecOps instance. From the sidebar, navigate to **Response > Playbooks** section.
    ![Sidebar - Playbooks](<./screenshots/Playbook Section.png>)

- Click on the **three dots** icon at the top of the Playbooks, and then click on **Import**.
  ![Import Playbook](<./screenshots/Import Playbook.png>)

- Select the `.zip` file downloaded earlier.

The playbooks stored in the file would be imported. We can access these under the **Imported Playbooks** folder. These playbooks and blocks can be moved to any other folder of our choice.

**Important:** Before using any playbook with an alert, review its default settings (triggers, action parameters, etc.) to ensure they align with your needs.

---
## Documentation

- [Playbooks](#playbooks)
  - [Noise Elimination](#noise-elimination)
  - [Network Contamination Based on GreyNoise IP Feed](#network-contamination-based-on-greynoise-ip-feed)
- [Blocks](#blocks)
  - [Network Contamination Block](#network-contamination-block)
---
## Playbooks

Playbooks are a feature in Google Security Operations (SecOps) that can be used to automatically perform actions on alerts/cases when triggered. Playbooks can be used to: Retrieve information about alerts, Remediate threats, Create tickets, and Manage toxic combinations and IAM recommendations.

**Points to Note:**

- Each playbook requires a trigger, which decides when the playbook would be run. For some of the playbooks created, the Trigger is set as **All**. Users can update the Trigger conditions based on the requirements.
- The imported playbooks are disabled by default. User can easily enable any playbook by simply cliking on the toggle button beside the playbook name. ([Reference](https://cloud.google.com/chronicle/docs/soar/respond/working-with-playbooks/whats-on-the-playbooks-screen#:~:text=At%20the%20top%20segment%20of%20the%20playbook%20designer%20pane%2C%20you%20can%20use%20the%20horizontal%20toggling%20button%20to%20enable%20or%20disable%20the%20playbook.))


### Noise Elimination

This playbook updates the priority level of an Alert based on GreyNoise reputation data for IP addresses. [Download](<./Noise Elimination.zip>)

![Playbook - Noise Elimination](<./screenshots/playbooks/Noise Elimination.png>)

**Actions in Use:**

- **GreyNoise - Quick IP Lookup:** Queries GreyNoise API to enrich IP entities with classification, trust level, and threat intelligence data
- **Siemplify - Change Alert Priority:** Maps the GreyNoise classification to alert severity levels.

**Priority mapping to Alerts as per the GreyNoise Classification:**

| GreyNoise Classification | Alert Priority |
|-------------------------|----------------|
| malicious               | High          |
| suspicious              | Medium        |
| benign                  | Low           |
| unknown                 | Unchanged     |
| (unseen)                | Unchanged     |

---

### Network Contamination Based on GreyNoise IP Feed

This playbook blocks or unblocks IP on Firewall based on the GreyNoise IP feed ingested via Webhook. [Download](<./Network Contamination Based on GreyNoise IP Feed.zip>)

![Playbook - Network Contamination Based on GreyNoise IP Feed](<./screenshots/playbooks/Network Contamination Based on GreyNoise IP Feed.png>)

**Actions in Use:**

- **Siemplify - Create Entity:** Used to create an ADDRESS Entity from the GreyNoise Feed which will be utilised by the Zscaler - Add To Blacklist/Zscaler - Add To Whitelist action.
- **Zscaler - Add To Blacklist:** Blocks the collected IP Address from the GreyNoise IP Classification change Feed.
- **Zscaler - Add to Whitelist:** Unblocks the collected IP Address from the GreyNoise IP Classification change Feed.

---

## Blocks

### Network Contamination Block

This reusable block automates the process of identifying and blocking malicious IP addresses associated with specific CVEs using GreyNoise intelligence. [Download](<./Network Contamination Block.zip>)

**Use Case**

This block retrieves IP addresses from GreyNoise associated with a specific CVE. To narrow down the query, it allows filtering based on GreyNoise IP classification and last seen date, and also allows the user to limit the total result count to fit in the limitations of some firewalls. The identified IPs are then automatically blocked using the configured firewall or security device (such as Fortigate or Zscaler).

**Actions in Use**

- **GreyNoise - Execute GNQL Query:** Used to query GreyNoise for IP addresses associated with specific CVEs.
- **Siemplify - Create Entity:** Used to create the ADDRESS Entities returned from the GNQL Query response which will be utilised by the Zscaler - Add To Blacklist action.
- **Zscaler - Add To Blacklist:** Blocks the collected IP Addresses.

**Note:** As we need multiple user input to be added before execution we have created this as a block which can be manually attached to Alert or reused with any existing playbook. Users could create a separate playbook and use this block to perform the Network Contamination Use case.

![Block - Network Contamination Block](<./screenshots/playbooks/Network Contamination Block.png>)

---

## Troubleshooting

In case of any failures when running any playbook, we can debug the same by running the playbook in the Simulator Mode. For more details, please refer to this guide: [Google SecOps playbooks - Simulator](https://cloud.google.com/chronicle/docs/soar/respond/working-with-playbooks/working-with-playbook-simulator).

---
## References

- [GreyNoise Documentation](https://docs.greynoise.io/)
- [Google SecOps Playbooks Documentation](https://cloud.google.com/chronicle/docs/secops/google-secops-soar-toc#work-with-playbooks)

---

For questions or support, please contact your GreyNoise or Google SecOps administrator.
