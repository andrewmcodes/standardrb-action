> [!CAUTION]
> This action is not maintained and is being actively maintained by the Standard Ruby team at [standardrb/standard-ruby-action](https://github.com/standardrb/standard-ruby-action)


# :white_check_mark: StandardRB Action

A GitHub Action to run [StandardRB](https://github.com/testdouble/standard) against your code and create annotations in the GitHub UI.

## :page_facing_up: Introduction

GitHub Actions are an amazing new tool that can dramatically improve productivity while using the GitHub platform. While it is not hard to write a custom GitHub action to run StandardRB on your codebase, this action takes that functionality one step further using the checks API. After the StandardRB Linter Action runs StandardRB against your code, it will create annotations that you can easily view, matched up with the offending code.

## :bulb: Usage

Add the following to your GitHub action workflow to use StandardRB Linter Action:

```yaml
- name: StandardRB Linter
  uses: andrewmcodes/standardrb-action@v2.0.0
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### :package: Example Workflow

Here is an example workflow file incorporating StandardRB Linter Action:

```yaml
name: StandardRB

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: StandardRB Linter
      uses: andrewmcodes/standardrb-action@v2.0.0
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## :warning: Gotchas

Due to the GitHub Check Runs API, we can only return 50 annotations per run. See [here](https://developer.github.com/v3/checks/runs/#output-object) for more info.

This is not an issue if you remove this action from your workflow and replace with `bundle exec standardrb --format github --parallel` as mentioned in the caution above.

## :camera_flash: Screenshots

![StandardRB Action Checks Overview](screenshots/check-overview.png)
![StandardRB Action File Annotation](screenshots/file-annotation.png)

## :bookmark: Changelog

[View our Changelog](/CHANGELOG.md)

## :sos: Contributing

[Contributing Guide](/CONTRIBUTING.md)

## :rotating_light: Code of Conduct

[Code of Conduct](/CODE_OF_CONDUCT.md)

## :copyright: License

[MIT](/LICENSE.md)
