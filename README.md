# Blue-Green-Deployment
Blue-Green-Deployment
🚀 Blue-Green Deployment on Azure VMSS with Application Gateway, Terraform & Ansible
This project demonstrates a zero-downtime Blue-Green deployment strategy on Azure using VM Scale Sets, Application Gateway, and Ansible automation. It provisions two isolated environments (blue_vmss and green_vmss) and enables safe traffic switching using dummy routing rules and health probes — ensuring backend readiness before live traffic is transferred.

📌 Overview
- 🌐 Cloud: Azure
- ⚙️ IaC: Terraform
- 📦 Automation: Ansible
- 🖥️ Compute: Azure VM Scale Sets
- 🔀 Routing: Azure Application Gateway
- 🧪 Validation: Health probes
- 🧠 Languages: HCL, YAML, Shell

This application is publicly accessible via my custom domain:
🔗 http://nishantg.shop
The domain is mapped to the Azure Application Gateway, which dynamically routes traffic to either the blue or green VMSS backend based on deployment status. Health probes and dummy routing rules ensure that only validated environments receive live traffic


## 🧩 Key Components

| Component              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `blue_vmss`            | Hosts App1 — initial production environment                                 |
| `green_vmss`           | Hosts App2 — new version for deployment                                     |
| `Application Gateway`  | Routes traffic using backend pools     |
| `Health Probes`        | Validate readiness of green backend before switching live traffic           |
| `Ansible Playbooks`    | Automate app deployment, traffic switch, and rollback                      |
| `Terraform Modules`    | Provision VMSS, networking, and gateway infrastructure                      |
| `Custom HTML Pages`    | Serve app metadata, hostname, and status from `/app1` and `/app2` directories |
| `Switch & Rollback Scripts` | Control traffic flow between blue and green environments safely     |


⚙️ Workflow
- Provision Infrastructure
Terraform creates two VMSS environments and configures Application Gateway with dummy rules and health probes.
- Deploy App1 (Blue)
Ansible installs Apache2, sets up /app1 pages, and configures metadata.
- Deploy App2 (Green)
Ansible installs App2 on green VMSS with updated UI and versioning.
- Validate Green Backend
Dummy routing rules and probes confirm readiness without affecting live traffic.
- Switch Traffic
Ansible updates Application Gateway backend pool to route traffic from blue to green.
- Rollback (if needed)
Rollback playbook restores traffic to blue VMSS in case of failure.

🧪 Validation Pages
- /app2/index.html — App2 homepage with green background
- /app2/status.html — Displays current app version
- /app2/metadata.html — Injected Azure instance metadata
- /app2/hostname.html — Shows VM hostname for traceability

📸 Sample HTML Output
<body style="background-color:rgb(144, 238, 144);">
  <h1>Welcome to Nishant Gawande's WebVM - APP2</h1>
  <p>Terraform + Ansible Deployment Demo</p>
  <p>Application Version: V2</p>
</body>



🏆 Highlights
- ✅ Zero-downtime deployment using Blue-Green strategy
- 🔐 Secure & compliant provisioning with NSGs and probe isolation
- 🔄 Automated traffic switch & rollback using Ansible
- 📈 Scalable architecture with VMSS and Application Gateway
- 🧠 Metadata-driven validation for observability and traceability
