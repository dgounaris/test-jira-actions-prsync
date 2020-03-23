action "Create Jira Issue" {
  uses = "atlassian/gajira-create@v1.0.0"
  needs = ["Jira Login"]
  args = "--project=DPG --issuetype=Story --summary=\"{{ event.issue.title }}\" --description=$'{{ event.issue.body }}\\n\\n_Created from GitHub Action_'"
}

workflow "Create issue" {
  on = "issues"
  resolves = ["Create Jira Issue"]
}

action "Jira Login" {
  uses = "atlassian/gajira-login@v1.0.0"
  uses = "./"
  secrets = ["JIRA_API_TOKEN=yNcMqAMZZV3VXdGhOfukFDEE", "JIRA_BASE_URL=https://dgoun.atlassian.net", "JIRA_USER_EMAIL=dgoungr@hotmail.com"]
}
