# Devconfigs

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

Devconfigs allow you to add shared VSCode [debug launcher](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations) and [task](https://code.visualstudio.com/docs/editor/tasks) configurations to your dev containers. Automate common setup tasks like setting up git hooks, authenticating to your secrets management service, and launching a local version of your app, all on container startup. And when you update your devconfigs the changes automatically sync to each project when you open that dev container.

This repository contains Stackfound's devconfigs.


## Table of Contents

- [Devconfigs](#devconfigs)
  - [Table of Contents](#table-of-contents)
  - [Background](#background)
  - [Install](#install)
  - [Usage](#usage)
  - [Maintainers](#maintainers)
  - [Contributing](#contributing)
  - [License](#license)

## Background

Find out why we created devconfigs and all that it's capable of in the [Guides post](https://stackfound.com/guides/introducing-devconfigs)!

## Install

First, install the [devconfigs-cli](https://github.com/stackfound/devconfigs-cli).

```sh
brew tap stackfound/devconfigs
brew install devconfigs-cli
```

Then, in the root of the repository where you want to use devconfigs

```sh
devconfigs init
```

Finally, reopen your project in a container and run the default build task (CMD + SHIFT + B)

With that, you should see the tasks specified in .devcontainer/devconfigs.yaml run automatically in the order specified in your devconfigs.yaml

## Usage

If you want to use Stackfound's devconfigs in your project, just add the repository URL to your devconfigs.yaml file.

You can find out more about how to use devconfigs in the [Guides post](https://stackfound.com/guides/introducing-devconfigs)!

## Maintainers

[@clayton-stackfound](https://github.com/clayton-stackfound).

## Contributing

Feel free to dive in! [Open an issue](https://github.com/stackfound/devconfigs/issues/new) or submit PRs.

## License

[MIT](LICENSE) © Stackfound