# Project Setup & Configuration Guide

This guide provides step-by-step instructions to replicate the CI/CD pipeline and run the Student Feedback Portal on a local environment.

## 1. Prerequisites
Ensure the following software is installed and configured in your system's `PATH`:
* **Java Development Kit (JDK):** Version 21
* **Apache Maven:** Version 3.8+
* **Git:** For version control and repository cloning
* **Jenkins:** Running locally (typically on port `8080`)
* **Apache Tomcat:** Version 10.1+ (configured to run on an alternate port like `8081` to avoid conflicts with Jenkins)

## 2. Local Environment Configuration
1. **Set `JAVA_HOME`:** Ensure the environment variable points to the JDK 21 installation directory.
2. **Set `MAVEN_HOME`:** Ensure this points to the Apache Maven directory.
3. **Tomcat Port Configuration:** 
   * Navigate to `<TOMCAT_DIR>/conf/server.xml`.
   * Locate the `<Connector port="8080"...>` tag and change it to `<Connector port="8081"...>`.
   * Start the Tomcat server.

## 3. Repository Setup
Clone the project repository to your local machine:
```bash
git clone <YOUR_REPOSITORY_URL>
cd devops-ci-cd-project