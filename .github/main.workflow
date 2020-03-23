action "Create Jira Issue" {
  uses = "atlassian/gajira-create@v1.0.0"
  needs = ["Login "]
  args = "--project=DPG --issuetype=Story --summary=\"{{ event.issue.title }}\" --description=$'{{ event.issue.body }}\\n\\n_Created from GitHub Action_'"
}

workflow "Create issue" {
  on = "issues"
  resolves = ["Create Jira Issue"]
}

action "Login " {
  uses = "atlassian/gajira-login@v1.0.0"
  needs = ["Filters opened"]
  secrets = ["yNcMqAMZZV3VXdGhOfukFDEE", "https://dgoun.atlassian.net", "dgoungr@hotmail.com"]
}

action "Filters opened" {
  uses = "actions/bin/filter@24a566c2524e05ebedadef0a285f72dc9b631411"
  args = "action opened"
}
