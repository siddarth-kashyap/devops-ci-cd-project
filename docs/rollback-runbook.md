###  `docs/rollback-runbook.md`

```markdown
# Rollback & Recovery Runbook

This runbook outlines the standard operating procedures for mitigating and recovering from failed deployments or broken builds in the CI/CD pipeline.

## Automated Quality Gate Failure (Prevention)
If a developer pushes code that breaks application logic (e.g., a failed unit test), the pipeline's Quality Gate will automatically trigger a failure at the **Test** stage. 
* **Impact:** The pipeline stops immediately. The broken `.war` file is *not* generated or deployed. The live Tomcat server remains untouched and stable.
* **Resolution (Fix Forward):** The developer must review the Jenkins console output, fix the failing test or code locally, and push a new commit to trigger a successful pipeline run.

## Scenario A: Bad Code Deployed to Production
If a bug passes the unit tests and is successfully deployed to the Tomcat server, causing live application issues, use one of the following rollback strategies:

### Strategy 1: Git Revert (Preferred / Automated)
This is the safest method as it maintains a clean version control history and utilizes the automated pipeline for the rollback.
1. Identify the last known good commit hash using `git log`.
2. Revert the repository to the stable state:
   ```bash
   git revert <BAD_COMMIT_HASH>