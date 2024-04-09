 > [!CAUTION]
> This action is unnecessary and will slow down your CI suite. As such, it is not actively maintained.
> To migrate, add this job to your workflow to achieve the same results:
>
> ```
> standardrb:
>   name: StandardRB
>   runs-on: ubuntu-latest
>   steps:
>     - uses: actions/checkout@v4
>     - uses: ruby/setup-ruby@v1
>       with:
>         bundler-cache: true
>     - run: bundle exec standardrb --format github --parallel
> ```

<div align="center">
  [![StandardRB](https://github.com/andrewmcodes/standardrb-action/actions/workflows/standard.yml/badge.svg)](https://github.com/andrewmcodes/standardrb-action/actions/workflows/standard.yml)
  [![Test](https://github.com/andrewmcodes/standardrb-action/actions/workflows/test.yml/badge.svg)](https://github.com/andrewmcodes/standardrb-action/actions/workflows/test.yml)
  [![build](https://github.com/andrewmcodes/standardrb-action/actions/workflows/build.yml/badge.svg)](https://github.com/andrewmcodes/standardrb-action/actions/workflows/build.yml)
  [![release](https://github.com/andrewmcodes/standardrb-action/actions/workflows/release.yml/badge.svg)](https://github.com/andrewmcodes/standardrb-action/actions/workflows/release.yml)
</div>

# :white_check_mark: StandardRB Action

A GitHub Action to run [StandardRB](https://github.com/testdouble/standard) against your code and create annotations in the GitHub UI.

## :page_facing_up: Introduction

GitHub Actions are an amazing new tool that can dramatically improve productivity while using the GitHub platform. While it is not hard to write a custom GitHub action to run StandardRB on your codebase, this action takes that functionality one step further using the checks API. After the StandardRB Linter Action runs StandardRB against your code, it will create annotations that you can easily view, matched up with the offending code.

## :bulb: Usage

Add the following to your GitHub action workflow to use StandardRB Linter Action:

```yaml
- name: StandardRB Linter
  uses: andrewmcodes/standardrb-action@v1.0.0
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
    - uses: actions/checkout@v1
    - name: StandardRB Linter
      uses: andrewmcodes/standardrb-action@v1.0.0
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## :warning: Gotchas

Due to the GitHub Check Runs API, we can only return 50 annotations per run. See [here](https://developer.github.com/v3/checks/runs/#output-object) for more info.

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
