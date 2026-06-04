# 🌐 Assignment 2: 3-Node Routing Lab (SDN-05)

## 📖 Overview
This assignment demonstrates IP routing and packet forwarding using Containerlab. We created a 3-node topology where a central Linux container acts as a router connecting two distinct subnets.

## 🏗️ Network Topology
The lab consists of three nodes:
* **hs1** (Host 1) - Belongs to Subnet 1 (`10.0.1.0/24` & `fc00:1::/64`)
* **rt1** (Router) - Connects both subnets and forwards traffic
* **hs2** (Host 2) - Belongs to Subnet 2 (`10.0.2.0/24` & `fc00:2::/64`)

**Architecture:** `hs1 <---> rt1 <---> hs2`

## ⚙️ Key Configurations
* **IP Forwarding:** Enabled on the router (`rt1`) via `sysctl -w net.ipv4.ip_forward=1` and IPv6 equivalent.
* **Automation:** Network interfaces, IP addresses, and default routes are automatically configured using a bind-mounted `entrypoint.sh` script.

## 🚀 How to Run & Test
1. **Deploy the topology:**
   ```bash
   sudo clab deploy -t containerlab/routing-lab.yml
   
2. **Verify IPv4 connectivity (Ping from hs1 to hs2):**
   ```bash
   docker exec clab-routing-lab-hs1 ping -c 3 10.0.2.2

3. **Verify IPv6 connectivity (Ping from hs1 to hs2):**
   ```bash
   docker exec clab-routing-lab-hs1 ping -6 -c 3 fc00:2::2

4. **Destroy the lab and clean up resources:**   
   ```bash
   sudo clab destroy -t containerlab/routing-lab.yml
      
