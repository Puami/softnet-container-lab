# 🌐 Software Networks Assignments

This repository contains my lab assignments for the Software Networks course, focusing on Containerlab and Linux networking.

---

## 📌 Section 1: Assignment SDN-04 (Bind-Mount)
**Goal:** Modify a basic 2-node topology to use a bind-mounted `entrypoint.sh` instead of baking it into the Docker image via `COPY`.

* **Topology File:** `containerlab/basic-lab.yml`
* **Network Structure:** `node1 <---> node2`
* **Status:** ✅ Completed (Successfully tested IPv4 & IPv6 connectivity)

---

## 📌 Section 2: Assignment SDN-05 (3-Node Router Topology)
**Goal:** Build a 3-node topology representing two separate subnets connected by a router. The router must forward traffic between the subnets automatically.

* **Topology File:** `containerlab/routing-lab.yml`
* **Network Structure:** `hs1 <---> rt1 (Router) <---> hs2`
* **Key Configurations:** * Enabled `net.ipv4.ip_forward` and IPv6 forwarding on the router.
  * Configured static IP routing via `entrypoint.sh`.
* **Status:** ✅ Completed (Achieved 0% packet loss between hs1 and hs2)

---
*Developed for Rome Tor Vergata ICT Engineering program.*
