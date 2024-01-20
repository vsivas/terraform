Scenario: Drift detection
Suppose if some one has logged in aws console and made some manual changes for any resource then terraform wont understand/track this change which will create issue. terraform refresh will update the state file.
solution 1: Run terraform refresh via a cron job (run hourly or daily) and verify output of terraform refresh and send notifications about the drift(manual change)
note: this solution is not 100% efficient as of now.
solution 2: 
  solution 2A: Configure strict IAM roles which will deny access to aws console for devops team. But this is difficult
  solution 2B : Set audit logs, do some automation by creating lambda and provide all list of resources managed by terraform.
              This lambda reads audit logs and finds if a resource (which is managed by terraform) is modfied (manually via console) but the change is done by IAM role/user instead of terraform role. Then it ends notification/alert saying this particular iam user has done modification on this resource. 