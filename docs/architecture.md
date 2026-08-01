# High-Level Architecture: CI/CD Pipeline

This document outlines the architecture and data flow for the automated Continuous Integration and Continuous Deployment (CI/CD) pipeline.

## System Flow Diagram

```text
Developer (Local Machine)
    |
    | (1) git push (feature/*, dev, main)
    v
Git Repository (GitHub)
    |
    | (2) Webhook / Poll SCM
    v
Jenkins Automation Server (Declarative Pipeline)
    |
    |-- Stage 1: Checkout (Pull source code)
    |-- Stage 2: Build (mvn clean compile)
    |-- Stage 3: Test (mvn test -> Quality Gate)
    |-- Stage 4: Package (mvn package -> generate .war)
    |-- Stage 5: Archive (Store artifact for rollback)
    |-- Stage 6: Deploy (Copy .war to Tomcat webapps)
    |-- Stage 7: Verify (cURL health check endpoint)
    |
    | (3) Automated Deployment
    v
Apache Tomcat Server (Application Hosting)
    |
    | (4) HTTP 200 OK
    v
Live Web Application (Accessible via Browser)