---

### 2. `README.md`
This is the front page of your repository. It acts as your project portfolio, explaining to recruiters or interviewers exactly what you achieved, the tools you used, and how it works.

```markdown
# End-to-End CI/CD Pipeline for a Java Web Application

## Project Overview
This project demonstrates a fully automated Continuous Integration and Continuous Deployment (CI/CD) pipeline for a Java-based web application (Student Feedback Portal). The pipeline eliminates manual software delivery bottlenecks by automatically compiling code, executing unit tests, packaging artifacts, and deploying to a live application server whenever new code is committed.

## Problem Statement
In traditional manual deployments, software delivery is slow, prone to human error, and lacks a clear rollback plan. This project solves these issues by introducing a repeatable pipeline that enforces quality gates and provides operational evidence (logs) for every deployment.

## Technology Stack
* **Language:** Java (JDK 21)
* **Build Automation:** Apache Maven
* **Source Control Management (SCM):** Git & GitHub
* **Continuous Integration / Continuous Deployment:** Jenkins (Declarative Pipeline)
* **Application Server:** Apache Tomcat
* **Testing Framework:** JUnit

## Application Features (Student Feedback Portal)
* Fully functional UI for submitting feedback.
* In-memory processing and redirection handling.
* Pre-loaded dataset integration for demonstration purposes.
* Dedicated `/health` endpoint for pipeline verification.

## Pipeline Stages
1. **Checkout:** Pulls the latest source code from the active Git branch.
2. **Build:** Cleans previous builds and compiles the Java source code.
3. **Test:** Executes JUnit test suites. (Acts as a Quality Gate: if tests fail, the pipeline stops to prevent bad deployments).
4. **Package:** Packages the compiled application into a deployable `.war` artifact.
5. **Archive:** Saves the successful `.war` artifact within Jenkins for version history and rapid rollbacks.
6. **Deploy:** Automatically deploys the artifact to the Apache Tomcat `webapps` directory.
7. **Verify:** Pauses for application startup, then executes a `cURL` command against the `/health` endpoint to ensure the deployment was successful (HTTP 200).

## Failure & Recovery Capabilities
This project includes documented failure scenarios, proving the resilience of the pipeline:
* **Quality Gate Failure:** Demonstrated by intentionally breaking a unit test. The pipeline safely halts at the `Test` stage, protecting the live server from receiving broken code.
* **Rapid Recovery:** Failed deployments can be resolved quickly by reverting to a previous Git commit or deploying a previously archived, stable `.war` file directly from Jenkins.

## Future Enhancements
To further scale the infrastructure, future iterations of this project will explore replacing the local Tomcat server with containerized deployments. This will involve using Docker to containerize the application, managing the deployment lifecycle via Kubernetes, and provisioning the underlying cloud infrastructure (such as AWS) using Terraform as Infrastructure as Code (IaC).
