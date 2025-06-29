# devops_ecommerce_project

# My DevOps Learning Journey: Evolving Microservices Deployment

This repository documents my progression in implementing DevOps practices for a microservices application, starting from basic manual deployments and evolving towards a fully automated CI/CD pipeline with IaC and configuration management.

## Phases of My DevOps Journey

### Phase 1: Manual & Shell Scripted Deployment

- **Goal:** Deploy an application in AWS EC2 along with creating hosted zone and records using Route 53.
- **[Explore Phase 1 Files](./Phase_1_Manual_Shell_Deploy/)**
- **Technologies Used:** AWS EC2, Route 53, Bash Scripting

This phase represents my initial approach to deploying the microservices. It relies heavily on manual steps and basic shell scripts for provisioning and configuration.

- **Problem Using Shell:** Manual deployments are prone to human error, time-consuming, and difficult to scale. Shell is pain in scale. Shell scripting is imperative and homogeneous.

### Phase 2: Configuration Management with Ansible (Current phase)

- **Goal:** Ensure consistent application deployments, dependency management, and service configuration.
- **[Explore Phase 2 Files](./Phase_2_Cong_Mgt_Ansible/)**
- **Technologies Used:** AWS EC2, Route 53, Ansible

This phase uses Ansible to automate EC2 instance configuration and microservices application deployment. Ansible offers a powerful, structured approach to automation, ensuring consistent environments across development, staging, and production, which reduces issues like "it works on my machine." It makes deployments repeatable for continuous delivery and, with its human-readable YAML playbooks, improves collaboration between development and operations. Ansible also automates repetitive tasks, freeing up engineers, and its playbooks act as living documentation for easier auditing and compliance.

- **Problem Using Ansible:**
