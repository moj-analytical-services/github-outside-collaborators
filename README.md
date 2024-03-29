# GitHub Outside Collaborators

Manage MoJ GitHub Organisation outside collaborators via code.

## Adding Collaborators

A Collaborator can be added to multiple repositories via the [form](https://github.com/moj-analytical-services/github-outside-collaborators/issues/new?assignees=&labels=collaborator%2Cpr-create-issue&template=create-pr-from-issue.yaml&title=Please+create+an+outside+collaborator+pull+request+) located in `Issues -> New Issue -> Create a Outside Collaborator Pull Request -> Get Started`. This form will automatically create a pull request with the collaborator added to the relevant Terraform files.

If you want to allow access to an MoJ GitHub repository for an outside collaborator, you can manually add/remove/edit the Terraform file/s, see the [Defining Collaborators](https://github.com/moj-analytical-services/github-outside-collaborators#defining-collaborators) section, followed by a new pull request with the required changes to the corresponding `terraform/[repository-name].tf` file(s).

If you are not confident working with Terraform, you can raise an issue using this template [questionnare](https://github.com/moj-analytical-services/github-outside-collaborators/issues/new?assignees=&labels=&template=access-request.md) to request access for a collaborator, and we will make the changes for you.

> PRs from forks do NOT work with the current automated process, please only create PRs from a branch.

## Background

Sometimes we need to grant access to one of more of our GitHub repositories to people who are not part of the "moj-analytical-services" GitHub organisation. This often happens when we engage third-party suppliers to carry out work on our behalf.

Github allows users called outside collaborators who are not part of the organisation access to an organisation's repositories. We can grant a certain level of access to a specific repository to an individual GitHub user account.

Rather than manage this via "clickops", this repository enables us to manage these relationships via Terraform code. This also means we can attach metadata to the collaborator relationship to explain its purpose. This will help to ensure that collaborators are removed when they no longer need access to the relevant GitHub repositories.

## How it works

- The `terraform/` directory contains a file per repository that has collaborators, defining the collaboration with metadata. The name of the file is the repository name with any `.` characters replaced with `-` to render the name acceptable for Terraform. i.e. the file for repository `foo.bar` will be `terraform/foo-bar.tf`
- Github actions run `terraform plan` and `terraform apply` to keep the collaborations in GitHub in sync with the Terraform source code
- The `terraform plan` and `terraform apply` use the Terraform module [github_repository_collaborator](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator) to add Outside Collaborators, who are defined in the Terraform source code, to the MoJ Github Organisation repositories.
- Ruby code in the `bin/` and `lib/` directories queries GitHub via the REST API and GraphQL API to retrieve all the collaborator relationships which exist.
- A GitHub action runs daily that compares the collaborators in GitHub with the Terraform source code. Any collaborators which are not fully specified in the Terraform source code are removed from found repositories.

## Removing Collaborators

1. If the collaborator is defined in Terraform code, you can either:

- Manually edit the Terraform file to remove the collaborator and raise a pull request to remove the collaborator from the repository.

- Manually run this [GitHub Action](https://github.com/moj-analytical-services/github-outside-collaborators/actions/workflows/remove-collaborator.yml) will edit and create the pull request to remove a specific collaborator from a repository:

  1. Click the `Run workflow` button
  2. Enter the repository name and the username of the collaborator to remove
  3. Click `Run workflow`

Alternatively the collaborator will be removed from the repository and Terraform file/s once their review_date has expired.

2. If the collaborator is not defined in Terraform code

There's nothing to do here - our automation will automatically remove that user from the repository, raise an issue on that repository, and inform us that the user was added to the repository incorrectly.

This occurs when access was granted by a repository administrator via the GitHub UI.

## Defining collaborators

To define collaborators on a repository, first add a Terraform file corresponding to the repository name (unless there already is one).

The filename should be `<repository-name>.tf` where `repository-name` is the repository name **with any `.` characters replaced by `-`**

The file should contain:

```
module "<repository-name>" {
  source     = "./modules/repository-collaborators"
  repository = "<repository-name>"
  collaborators = [
  ]
}
```

> The value of `repository` inside the file should be the exact name of the repository, with no substitutions. i.e. if the repository is called `moj-analytical-services/foo.bar` then put `repository = "foo.bar"`

To add collaborators to the repository, define each of them inside a `collaborators` block, with the following information inside the quotation marks:

```
    {
      github_user  = "<github username>"
      permission   = "push"  #  pull|push|admin
      name         = ""  #  The name of the person behind github_user
      email        = ""  #  Their email address
      org          = ""  #  The organisation/entity they belong to
      reason       = ""  #  Why is this person being granted access?
      added_by     = ""  #  Who made the decision to grant them access? e.g. 'Awesome Team <awesome.team@digital.justice.gov.uk>'
      review_after = ""  #  Date after which this grant should be reviewed/revoked, e.g. 2021-11-26
    },
```

Here's an example:

```
  collaborators = [
    {
      github_user  = "someuser"
      permission   = "admin"
      name         = "Real Name"
      email        = "name@acme.com"
      org          = "Acme. Corp."
      reason       = "Acme are building some stuff for us"
      added_by     = "team-name@digital.justice.gov.uk"
      review_after = "2021-11-26"
    },
  ]
```

The `added_by` line should contain an approvers email address that uses @digital.justice.gov.uk or @justice.gov.uk

You can add comments (prefixed with `#` on every line) to these files to provide additional context/information.

## Running Locally

### Environment Variables

- `OPS_BOT_TOKEN` must contain a GitHub personal access token (PAC) enabled for MoJ SSO, with the following scopes:

  - admin:org
  - repo
  - read:user
  - user:email

- `TERRAFORM` must define the Terraform executable (e.g. `/usr/local/bin/terraform0.13.5`)

- `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY` - credentials with access to the S3 bucket and DynamoDB state lock table holding the Terraform state.

See [env.example](./env.example) for more more information.

### Terraform Plan and Apply

To run a Terraform apply locally, you must first run:

`terraform plan`

To check for potential changes. Once complete (and no errors are returned), you can then run:

`terraform apply`

To commit the changes.

## Usage

### [bin/outside-collaborators.rb](.github/workflows/outside-collaborators-check.yaml)

This script is run on daily basis by the [GitHub action](https://github.com/moj-analytical-services/github-outside-collaborators/actions/workflows/outside-collaborators-check.yaml). You can also run it manually by triggering the action. To run it locally:

```
ruby bin/outside-collaborators.rb
```

The script checks collaborators in Terraform against collaborators in GitHub repositories. Unknown collaborators are removed from those repositories. Issues will be raised on repositories when collaborator expiry date is up for renewal or expired. Slack alerts and repository pull requests are automatically generated when a collaborator expiry is up for renewal and has expired. It will output all outside collaborators who are defined in the Terraform code compared to the collaborators on GitHub per repository and state which collaborators are missing. It will delete expired collaborator invites to a repository which has not been accepted within the allowed time.

## Documentation

Yard is used for documentation. It creates a html report within the `doc` folder:

```
gem install yard
yardoc 'lib/**/*.rb'
```

## Development

Install `bundler` (`gem install bundler`) then run `bundle install` to install the dependencies.

To run the unit tests use `bundle exec rspec` or `rspec`.

`rspec` will generate a code coverage report using simplecov and create a `coverage` folder. Open the report using `open coverage/index.html`

Install `rspec`:

```
gem install rspec --install-dir ./bin
```

### New Debugger Setup in VS Code

#### If updating:

Uninstall any Ruby extensions in VS Code. Then install the Ruby by Spotify extension. Rename existing `launch.json` to something else. Re-open VS Code.

#### If starting fresh:

Install the Ruby by Spotify extension.

Press the debug button to create a new `launch.json`. Use these settings for debugging and testing:

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python",
      "type": "python",
      "python": "${workspaceFolder}/venv/bin/python3",
      "request": "launch",
      "cwd": "${workspaceRoot}",
      "program": "${workspaceFolder}/scripts/check-collaborators-username.py",
      "console": "integratedTerminal",
      "args": [""]
    },
    {
      "type": "ruby_lsp",
      "name": "Debug - script",
      "request": "launch",
      "program": "ruby ${workspaceRoot}/bin/outside-collaborators.rb",
      "env": {
        "REALLY_POST_TO_SLACK": "0",
        "REALLY_POST_TO_GH": "0",
        "REALLY_SEND_TO_NOTIFY": "0",
        "NOTIFY_PROD_TOKEN: "add-prod-token",
        "NOTIFY_TEST_TOKEN: "add-test-token",
        "OPS_BOT_TOKEN": "add-ops-bot-token",
        "LOG_LEVEL": "debug",
        "SLACK_WEBHOOK_URL": "add-slack-link",
      }
    },
    {
      "name": "RSpec - file",
      "type": "ruby_lsp",
      "request": "launch",
      "program": "ruby ${workspaceRoot}/bin/bin/rspec ${file}"
    },
    {
      "name": "RSpec - all",
      "type": "ruby_lsp",
      "request": "launch",
      "program": "${workspaceRoot}/bin/bin/rspec"
    }
  ]
}
```

### Previous Debugger Setup

**Older versions of VS Code worked with `ruby-debug-ide`, this has been deprecated**

Install `ruby-debug-ide` (locally for VS-Code to debug the tests):

```
sudo gem install ruby-debug-ide
```

To debug in VS Code use the below launch configrations within `.vscode/launch.json`:

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python",
      "type": "python",
      "python": "${workspaceFolder}/venv/bin/python3",
      "request": "launch",
      "cwd": "${workspaceRoot}",
      "program": "${workspaceFolder}/scripts/check-collaborators-username.py",
      "console": "integratedTerminal",
      "args": [""]
    },
    {
      "name": "Ruby - File",
      "type": "Ruby",
      "request": "launch",
      "program": "${workspaceRoot}/bin/close-issues.rb",
      "env": {
        "REALLY_POST_TO_SLACK": "0",
        "REALLY_POST_TO_GH": "0",
        "REALLY_SEND_TO_NOTIFY": "0",
        "NOTIFY_PROD_TOKEN: "add-prod-token",
        "NOTIFY_TEST_TOKEN: "add-test-token",
        "OPS_BOT_TOKEN": "add-ops-bot-token",
        "LOG_LEVEL": "debug",
        "SLACK_WEBHOOK_URL": "add-slack-link",
      }
    },
    {
      "name": "RSpec - file",
      "type": "Ruby",
      "request": "launch",
      "program": "${workspaceRoot}/bin/bin/rspec",
      "args": ["${file}"]
    },
    {
      "name": "RSpec - all",
      "type": "Ruby",
      "request": "launch",
      "program": "${workspaceRoot}/bin/bin/rspec",
      "args": ["-I", "${workspaceRoot}"]
    }
  ]
}

```
