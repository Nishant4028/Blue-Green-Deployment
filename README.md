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

Screenshot:
<img width="1908" height="999" alt="Screenshot 2025-10-02 233842" src="https://github.com/user-attachments/assets/59df98ee-25b2-436d-975d-fdc438b37c48" />

---
<img width="1919" height="1001" alt="Screenshot 2025-10-02 232501" src="https://github.com/user-attachments/assets/0b054f4e-95d7-4df6-b7bf-0bd1f474877c" />

------
<img width="746" height="343" alt="image" src="https://github.com/user-attachments/assets/c4846a2d-5f92-4792-972d-19d90ac3e3b3" />

----
<img width="776" height="329" alt="image" src="https://github.com/user-attachments/assets/a27ea5d0-613b-4e53-9c4f-f85e9695228b" />

-----
<img width="1892" height="911" alt="Screenshot 2025-10-02 235800" src="https://github.com/user-attachments/assets/2feaffec-0a1b-45c0-a528-7fa95efd1c60" />

--------
<img width="1842" height="887" alt="Screenshot 2025-10-02 235354" src="https://github.com/user-attachments/assets/93607b67-75ea-4c19-8e35-cafbcad0de54" />

-------
<img width="1479" height="549" alt="Screenshot 2025-10-02 234415" src="https://github.com/user-attachments/assets/47e87ebe-3a34-47cb-9dae-c10bc0f41f36" />

-------
<img width="1047" height="397" alt="Screenshot 2025-10-02 235135" src="https://github.com/user-attachments/assets/7928ea3c-27ad-411e-878c-999c79bb043f" />

------------------ Green vmss app2 deploymemt 
<img width="1020" height="686" alt="Screenshot 2025-10-02 220018" src="https://github.com/user-attachments/assets/e754f239-8d9a-4371-a39e-378084c8c739" />

------------------ Blue vmss app1 deployment
<img width="1035" height="711" alt="Screenshot 2025-10-02 215947" src="https://github.com/user-attachments/assets/e7e4d975-cfed-40ad-b59a-cbbab7d7b665" />

--------------- Blue to Green----------
<img width="1666" height="706" alt="Screenshot 2025-10-02 232051" src="https://github.com/user-attachments/assets/8eb27734-d5e2-4f42-8cf4-eb59acb696f5" />
<img width="1651" height="634" alt="Screenshot 2025-10-02 232125" src="https://github.com/user-attachments/assets/89a2cb23-799e-4a7f-ac32-8b13b284f7a1" />

--------------- Green to Blue----------
<img width="1732" height="707" alt="Screenshot 2025-10-02 233750" src="https://github.com/user-attachments/assets/6c0a2930-5cd0-4ec6-a4a7-2fc752e20081" />
<img width="1849" height="613" alt="Screenshot 2025-10-02 233807" src="https://github.com/user-attachments/assets/ae7df62f-7506-4891-835f-c8e32eac0c50" />













